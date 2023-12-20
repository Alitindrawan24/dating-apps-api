package token

import (
	"dating-apps-api/internal/entity"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

// Interface of repository contains contract of the repository
type RepositoryInterface interface {
	FindAccessToken(*gin.Context, int64) (entity.AccessToken, error)
	InsertAccessToken(*gin.Context, entity.AccessToken) (entity.AccessToken, error)
	RevokeAccessToken(*gin.Context, int64) error
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
