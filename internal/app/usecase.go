package app

import (
	"dating-apps-api/internal/usecase/auth"
	"dating-apps-api/internal/usecase/token"
)

type UseCases struct {
	auth  auth.UseCaseInterface
	token token.UseCaseInterface
}

func NewUseCase(repository *Repositories) *UseCases {
	return &UseCases{
		auth:  auth.New(repository.auth),
		token: token.New(repository.token),
	}
}
