package auth

import (
	"dating-apps-api/internal/entity"

	"github.com/gin-gonic/gin"
)

func (repository *Repository) FindUserByEmail(ctx *gin.Context, email string) (user entity.User, err error) {
	err = repository.db.Where("email = ?", email).Find(&user).Error
	if err != nil {
		return entity.User{}, err
	}
	return user, nil
}

func (repository *Repository) AddUser(ctx *gin.Context, user entity.User) (entity.User, error) {

	// Insert user data into database
	err := repository.db.Create(&user).Error
	if err != nil {
		return entity.User{}, err
	}
	return user, nil
}
