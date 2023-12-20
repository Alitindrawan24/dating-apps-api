package match

import (
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/pkg/exception"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func (repository *Repository) FindUserProfile(ctx *gin.Context, user entity.User) (entity.User, error) {
	var matchUser []entity.Match

	// Get list of already viewed today
	err := repository.db.Table("matchs").
		Where("date(matchs.created_at) = ?", time.Now().Format("2006-01-02")).
		Where("user_id = ?", user.ID).
		Where("status != ?", 0).
		Find(&matchUser).
		Error
	if err != nil {
		return entity.User{}, err
	}

	// Mapping into int64
	var ignoreID []int64
	for _, match := range matchUser {
		ignoreID = append(ignoreID, match.TargetID)
	}

	// Check already viewed 10 profiles or not
	if len(ignoreID) >= 10 && !user.IsPremium {
		return entity.User{}, exception.New("Only can view 10 profiles each day. Use premium to view more")
	}

	// Get view profile
	var targetUser entity.User
	err = repository.db.
		Where("id != ?", user.ID).
		Where("gender != ?", user.Gender).
		Not(ignoreID).
		Find(&targetUser).
		Error
	if err != nil {
		return entity.User{}, err
	}

	return targetUser, nil
}

func (repository *Repository) UpdateOrInsertMatch(ctx *gin.Context, userID int64, targetID int64) (entity.Match, error) {
	var match entity.Match
	err := repository.db.
		Table("matchs").
		Where("status = ?", 0).
		Where("user_id = ?", userID).
		Where("target_id = ?", targetID).
		Where("date(created_at) = ?", time.Now().Format("2006-01-02")).
		Find(&match).
		Error
	if err != nil {
		return entity.Match{}, err
	}

	if match.UUID == "" {
		match = entity.Match{
			UUID:     uuid.New().String(),
			UserID:   userID,
			TargetID: targetID,
			Status:   0,
		}

		err = repository.db.
			Table("matchs").
			Create(&match).
			Error

		if err != nil {
			return entity.Match{}, err
		}

		return match, nil
	}

	return match, nil
}

func (repository *Repository) StoreMatch(ctx *gin.Context, match entity.Match) error {
	status := match.Status

	err := repository.db.
		Table("matchs").
		Where("uuid = ?", match.UUID).
		Find(&match).
		Error
	if err != nil {
		return err
	}

	match.Status = status

	err = repository.db.Table("matchs").
		Where("uuid = ?", match.UUID).
		Save(&match).
		Error
	if err != nil {
		return err
	}

	return nil
}
