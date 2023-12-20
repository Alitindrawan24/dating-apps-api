package auth

import (
	"dating-apps-api/internal/usecase/auth"
	"dating-apps-api/internal/usecase/token"
)

type Handler struct {
	authUseCase  auth.UseCaseInterface
	tokenUseCase token.UseCaseInterface
}

func New(authUseCase auth.UseCaseInterface, tokenUseCase token.UseCaseInterface) *Handler {
	return &Handler{
		authUseCase,
		tokenUseCase,
	}
}
