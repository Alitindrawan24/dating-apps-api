package app

import (
	"dating-apps-api/internal/usecase/auth"
	"dating-apps-api/internal/usecase/match"
	"dating-apps-api/internal/usecase/token"
)

type UseCases struct {
	auth  auth.UseCaseInterface
	token token.UseCaseInterface
	match match.UseCaseInterface
}

func NewUseCase(repository *Repositories) *UseCases {
	return &UseCases{
		auth:  auth.New(repository.auth),
		token: token.New(repository.token),
		match: match.New(repository.match),
	}
}
