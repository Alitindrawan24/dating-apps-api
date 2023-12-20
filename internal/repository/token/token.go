package token

import (
	"dating-apps-api/internal/entity"

	"github.com/gin-gonic/gin"
)

func (repository *Repository) FindAccessToken(ctx *gin.Context, ID int64) (token entity.AccessToken, err error) {
	err = repository.db.Where("id = ?", ID).Preload("User").Find(&token).Error
	if err != nil {
		return entity.AccessToken{}, err
	}
	return token, nil
}

func (repository *Repository) InsertAccessToken(ctx *gin.Context, token entity.AccessToken) (entity.AccessToken, error) {
	err := repository.db.Create(&token).Error
	if err != nil {
		return entity.AccessToken{}, err
	}
	return token, nil
}

func (repository *Repository) RevokeAccessToken(ctx *gin.Context, userID int64) error {
	err := repository.db.Model(&entity.AccessToken{}).Where("user_id = ?", userID).Delete(&entity.AccessToken{}).Error
	if err != nil {
		return err
	}
	return nil
}
