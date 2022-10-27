package main

import (
	"encoding/json"
	"fmt"
	"os"
	"sync"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/recover"
)

func main() {
	app := fiber.New()

	app.Use(recover.New())

	var logFileLock sync.Mutex

	app.All("/webhook", func(c *fiber.Ctx) error {
		logFileLock.Lock()
		defer logFileLock.Unlock()

		logFile, err := os.OpenFile("history.log", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
		if err != nil {
			panic(err)
		}
		defer logFile.Close()

		timestamp := time.Now().UTC()
		method := c.Method()
		headersData, _ := json.Marshal(c.GetReqHeaders())
		bodyData := c.Body()

		fmt.Fprintln(logFile, "+++++\n"+
			"Timestamp: "+fmt.Sprint(timestamp)+"\n"+
			"Method: "+method+"\n"+
			"Headers: "+string(headersData)+"\n"+
			"Body: "+string(bodyData)+"\n"+
			"-----\n",
		)

		logFile.Sync()

		return c.SendStatus(200)
	})

	app.Listen(":8080")
}
