package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	api := r.Group("/api")

	api.GET("/hello", func(c *gin.Context) {
		c.String(http.StatusOK, "world")
	})

	r.Run(":3300")
}
