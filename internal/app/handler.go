package app

import (
	"dating-apps-api/internal/handler/auth"
	"dating-apps-api/internal/handler/match"
)

type Handlers struct {
	Auth  *auth.Handler
	Match *match.Handler
}

func NewHandler(usecase *UseCases) *Handlers {
	return &Handlers{
		Auth:  auth.New(usecase.auth, usecase.token),
		Match: match.New(usecase.match),
	}
}
