package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
)

func main() {

	// creaete maping of routing to function
	r := gin.Default()
	r.GET("/hello", sayHello)
	r.Run(":3000")
}

func sayHello(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"data": "v2: Hello to the world",
	})
}
