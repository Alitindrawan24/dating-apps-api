package match

import "dating-apps-api/internal/usecase/match"

type Handler struct {
	matchUseCase match.UseCaseInterface
}

func New(matchUseCase match.UseCaseInterface) *Handler {
	return &Handler{
		matchUseCase,
	}
}
