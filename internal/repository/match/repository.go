package match

import (
	"dating-apps-api/internal/entity"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

// Interface of repository contains contract of the repository
type RepositoryInterface interface {
	FindUserProfile(*gin.Context, entity.User) (entity.User, error)
	UpdateOrInsertMatch(*gin.Context, int64, int64) (entity.Match, error)
	StoreMatch(*gin.Context, entity.Match) error
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
