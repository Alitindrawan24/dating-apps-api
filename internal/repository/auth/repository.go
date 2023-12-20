package auth

import (
	"dating-apps-api/internal/entity"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

// Interface of repository contains contract of the repository
type RepositoryInterface interface {
	FindUserByEmail(*gin.Context, string) (entity.User, error)
	AddUser(*gin.Context, entity.User) (entity.User, error)
	UpdateUser(*gin.Context, entity.User) error
}

// Struct of repository
type Repository struct {
	db *gorm.DB
}

func New(db *gorm.DB) RepositoryInterface {
	return &Repository{
		db,
	}
}
