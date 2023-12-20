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
}

// Struct of usecase
type UseCase struct {
	authRepository auth.RepositoryInterface
}

// New returns a UseCaseInterface that can be used to interact with the repository.
//
// @param authRepository - The auth repository to use. Must not be nil.
//
// @return The use case interface for use cases that are part of the auth repository
func New(authRepository auth.RepositoryInterface) UseCaseInterface {
	return &UseCase{
		authRepository,
	}
}
