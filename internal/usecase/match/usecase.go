package match

import (
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/repository/match"

	"github.com/gin-gonic/gin"
)

// Interface of usecase contains contract of the use case
type UseCaseInterface interface {
	GetUserProfile(*gin.Context, entity.User) (entity.User, error)
	CreateUserMatch(*gin.Context, int64, int64) (entity.Match, error)
	StoreUserMatch(*gin.Context, MatchRequest) error
}

// Struct of usecase
type UseCase struct {
	matchRepository match.RepositoryInterface
}

func New(matchRepository match.RepositoryInterface) UseCaseInterface {
	return &UseCase{
		matchRepository,
	}
}
