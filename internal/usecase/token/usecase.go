package token

import (
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/repository/token"

	"github.com/gin-gonic/gin"
)

type UseCaseInterface interface {
	CreateAccessToken(*gin.Context, entity.User) (string, error)
	ValidateAccessToken(*gin.Context, int64, string) (entity.User, error)
}

// Struct of usecase
type UseCase struct {
	tokenRepository token.RepositoryInterface
}

func New(tokenRepository token.RepositoryInterface) UseCaseInterface {
	return &UseCase{
		tokenRepository,
	}
}
