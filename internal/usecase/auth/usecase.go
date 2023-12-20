package auth

import (
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/repository/auth"

	"github.com/gin-gonic/gin"
)

// Interface of usecase contains contract of the use case
type UseCaseInterface interface {
	LoginUser(*gin.Context, LoginRequest) (entity.User, error)
	RegisterUser(*gin.Context, RegisterRequest) (entity.User, error)
	UpgradeUser(*gin.Context, entity.User) error
}

// Struct of usecase
type UseCase struct {
	authRepository auth.RepositoryInterface
}

func New(authRepository auth.RepositoryInterface) UseCaseInterface {
	return &UseCase{
		authRepository,
	}
}
