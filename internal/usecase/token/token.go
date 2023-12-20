package token

import (
	"crypto/sha256"
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/pkg/hasher"
	"dating-apps-api/internal/pkg/random"
	"errors"
	"fmt"
	"strconv"

	"github.com/gin-gonic/gin"
)

func (usecase *UseCase) CreateAccessToken(ctx *gin.Context, user entity.User) (string, error) {
	// Create the token
	token := random.GenerateRandomString(40)
	hashedToken := hasher.SHA256(token)

	// Call RevokeAccessToken to Remove user access token from database
	err := usecase.tokenRepository.RevokeAccessToken(ctx, user.ID)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return "", err
	}

	// Mapping access token
	accessToken := entity.AccessToken{
		UserID: user.ID,
		Token:  hashedToken,
	}

	// Call InsertAccessToken from repository to insert access token into database
	accessToken, err = usecase.tokenRepository.InsertAccessToken(ctx, accessToken)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return "", err
	}

	// Formatting the access token
	token = strconv.Itoa(int(accessToken.ID)) + "|" + token

	return token, nil
}

func (usecase *UseCase) ValidateAccessToken(ctx *gin.Context, ID int64, token string) (entity.User, error) {
	// Call FindAccessToken to get access token from database
	accessToken, err := usecase.tokenRepository.FindAccessToken(ctx, ID)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return entity.User{}, err
	}

	// Validate the token
	// Hash the user-provided plain text string using SHA-256.
	hashes := sha256.Sum256([]byte(token))
	hashedPlainString := fmt.Sprintf("%x", hashes[:])
	if hashedPlainString != accessToken.Token {
		return entity.User{}, errors.New("not matched")
	}

	// Map the users
	user := accessToken.User

	return user, nil
}
