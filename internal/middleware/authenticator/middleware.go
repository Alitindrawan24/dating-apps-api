package authenticator

import "dating-apps-api/internal/usecase/token"

type Middleware struct {
	tokenUseCase token.UseCaseInterface
}

// New initializes middleware.
func New(tokenUseCase token.UseCaseInterface) *Middleware {
	return &Middleware{
		tokenUseCase,
	}
}
