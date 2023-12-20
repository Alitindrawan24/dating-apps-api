package match

import (
	"dating-apps-api/internal/entity"
	"fmt"

	"github.com/gin-gonic/gin"
)

func (usecase *UseCase) GetUserProfile(ctx *gin.Context, user entity.User) (entity.User, error) {

	user, err := usecase.matchRepository.FindUserProfile(ctx, user)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return entity.User{}, err
	}

	return user, nil
}

func (usecase *UseCase) CreateUserMatch(ctx *gin.Context, userID int64, targetID int64) (entity.Match, error) {

	match, err := usecase.matchRepository.UpdateOrInsertMatch(ctx, userID, targetID)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return entity.Match{}, err
	}

	return match, nil
}

func (usecase *UseCase) StoreUserMatch(ctx *gin.Context, matchRequest MatchRequest) error {
	var status int8
	if matchRequest.Swipe == "right" {
		status = 1
	} else {
		status = 2
	}

	match := entity.Match{
		UUID:   matchRequest.MatchID,
		Status: status,
	}

	err := usecase.matchRepository.StoreMatch(ctx, match)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return err
	}

	return nil
}
