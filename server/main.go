package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"helloworld/config"
	"helloworld/models"
)

func main() {
	// Load configuration
	config.LoadConfig()

	// Set Gin mode
	gin.SetMode(config.AppConfig.GinMode)

	// Connect to database
	config.ConnectDB()

	// Auto migrate models
	config.DB.AutoMigrate(&models.User{})

	// Initialize router
	r := gin.Default()

	// Basic health check endpoint
	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "ok",
			"env":    config.AppConfig.Env,
		})
	})

	// Start server
	log.Printf("Server starting on port %s...", config.AppConfig.Port)
	r.Run(":" + config.AppConfig.Port)
}
