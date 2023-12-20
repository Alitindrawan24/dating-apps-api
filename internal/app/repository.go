package app

import (
	"dating-apps-api/internal/repository/auth"
	"dating-apps-api/internal/repository/match"
	"dating-apps-api/internal/repository/token"

	"gorm.io/gorm"
)

type Repositories struct {
	auth  auth.RepositoryInterface
	token token.RepositoryInterface
	match match.RepositoryInterface
}

func NewRepository(db *gorm.DB) *Repositories {
	return &Repositories{
		auth:  auth.New(db),
		token: token.New(db),
		match: match.New(db),
	}
}
