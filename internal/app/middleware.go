package app

import (
	"dating-apps-api/internal/middleware/authenticator"
	"dating-apps-api/internal/middleware/panichandler"
)

type Middleware struct {
	PanicHandler  *panichandler.Middleware
	Authenticator *authenticator.Middleware
}

func NewMiddleware(useCase *UseCases) *Middleware {
	return &Middleware{
		PanicHandler:  panichandler.New(),
		Authenticator: authenticator.New(useCase.token),
	}
}
