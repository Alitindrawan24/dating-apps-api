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
}

// Struct of repository
type Repository struct {
	db *gorm.DB
}

// New creates a new instance of RepositoryInterface. It is the caller s responsibility to call Close on the RepositoryInterface when finished with it.
//
// @param db - The database to use for the repository. This must be passed by the caller and not modified by the caller.
//
// @return A new instance of RepositoryInterface with the given database
func New(db *gorm.DB) RepositoryInterface {
	return &Repository{
		db,
	}
}
