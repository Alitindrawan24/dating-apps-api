package main

import (
	"dating-apps-api/internal/app"
	"dating-apps-api/internal/pkg/config"
	"errors"
	"fmt"
	"net/http"
	"os"
	"os/signal"

	"github.com/gin-gonic/gin"
	_ "github.com/joho/godotenv/autoload"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func main() {

	db, err := postgresConnect()
	if err != nil {
		panic(err)
	}

	repository := app.NewRepository(db)
	usecase := app.NewUseCase(repository)
	handler := app.NewHandler(usecase)
	middleware := app.NewMiddleware(usecase)

	router := gin.Default()
	router.Use(middleware.PanicHandler.HandlePanic())

	// GET /
	router.GET("/", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"app":     "Dating Apps API",
			"version": 0.1,
		})
	})

	// POST /register
	router.POST("/register", handler.Auth.HandleRegister)
	// POST /login
	router.POST("/login", handler.Auth.HandleLogin)

	// GET /match
	router.GET("/match", middleware.Authenticator.Authenticate(), handler.Match.HandleGetMatch)
	// POST /match
	router.POST("/match", middleware.Authenticator.Authenticate(), handler.Match.HandleStoreMatch)

	// GET /users
	router.GET("/users", middleware.Authenticator.Authenticate(), handler.Auth.HandleUser)

	// POST /users/upgrade
	router.POST("/users/upgrade", middleware.Authenticator.Authenticate(), handler.Auth.HandleUpgrade)

	port := 8080
	go func() {
		err := router.Run(fmt.Sprintf(":%d", port))
		if err != nil {
			panic(fmt.Sprintf("Failed to start the web server: %v", err))
		}
	}()

	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)

	// Block until we receive our signal.
	<-c

	fmt.Printf("Server stopped\n")
}

func postgresConnect() (*gorm.DB, error) {
	dbConnection := config.Get("DB_GORM_CONNECTION")
	if dbConnection == "" {
		return nil, errors.New("can't connect to DB")
	}

	dsn := dbConnection
	db, err := gorm.Open(postgres.Open(dsn))

	if err != nil {
		return db, err
	}

	fmt.Println("Connection to database established")
	return db, nil
}
