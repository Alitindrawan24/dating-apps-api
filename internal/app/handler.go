package app

import (
	"dating-apps-api/internal/handler/auth"
)

type Handlers struct {
	Auth *auth.Handler
}

func NewHandler(usecase *UseCases) *Handlers {
	return &Handlers{
		Auth: auth.New(usecase.auth, usecase.token),
	}
}
