package auth

import (
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/pkg/exception"
	"fmt"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
)

func (usecase *UseCase) LoginUser(ctx *gin.Context, loginRequest LoginRequest) (entity.User, error) {
	var user entity.User

	// Call FindUserByEmail from repository to find existing user using email input
	user, err := usecase.authRepository.FindUserByEmail(ctx, loginRequest.Email)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return entity.User{}, err
	}

	// Validate the user is already registered or not
	if user.ID == 0 {
		return entity.User{}, exception.New("Credentials invalid")
	}

	// Validate the password
	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(loginRequest.Password))
	if err != nil {
		return entity.User{}, exception.New("Credentials invalid")
	}

	return user, nil
}

func (usecase *UseCase) RegisterUser(ctx *gin.Context, registerRequest RegisterRequest) (entity.User, error) {

	var user entity.User

	// Call FindUserByEmail from repository to find existing user using email input
	user, err := usecase.authRepository.FindUserByEmail(ctx, registerRequest.Email)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return entity.User{}, err
	}

	// Check the user is already registered or not
	if user.ID != 0 {
		return entity.User{}, exception.New("User with email " + registerRequest.Email + " already registered")
	}

	// Hashing passwords
	hashedPassword, _ := bcrypt.GenerateFromPassword([]byte(registerRequest.Password), bcrypt.DefaultCost)

	// Mapping request into user entity
	user = entity.User{
		Email:          registerRequest.Email,
		FullName:       registerRequest.FullName,
		Gender:         registerRequest.Gender,
		DateOfBirth:    registerRequest.DateOfBirth,
		Location:       registerRequest.Location,
		Description:    registerRequest.Description,
		Password:       string(hashedPassword),
		ProfilePicture: "https://picsum.photos/200",
		IsPremium:      false,
	}

	// Call AddUser from repository to insert user data
	user, err = usecase.authRepository.AddUser(ctx, user)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return entity.User{}, err
	}

	return user, nil
}

func (usecase *UseCase) UpgradeUser(ctx *gin.Context, user entity.User) error {
	// Set user premium to true
	user.IsPremium = true

	// Call UpdateUser from repository to update user premium status
	err := usecase.authRepository.UpdateUser(ctx, user)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		return err
	}

	return nil
}
