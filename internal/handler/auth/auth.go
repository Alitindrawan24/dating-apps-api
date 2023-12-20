package auth

import (
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/pkg/formatter"
	"dating-apps-api/internal/pkg/requestvalidator"
	"dating-apps-api/internal/pkg/writer"
	"dating-apps-api/internal/usecase/auth"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func (handler *Handler) HandleLogin(ctx *gin.Context) {
	var loginRequest auth.LoginRequest

	// Validate user request payload
	if err := ctx.ShouldBindJSON(&loginRequest); err != nil {
		out := requestvalidator.Validate(err)
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIResponse("Validation error", false, out))
		return
	}

	// Call usecase to login the user
	user, err := handler.authUseCase.LoginUser(ctx, loginRequest)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIErrorResponse("Something went wrong", err))
		return
	}

	// call usecase to generate access token
	token, err := handler.tokenUseCase.CreateAccessToken(ctx, user)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIErrorResponse("Something went wrong", err))
		return
	}

	// Mapping response from user data
	loginResponse := AuthResponse{
		FullName:       user.FullName,
		Email:          user.Email,
		ProfilePicture: user.ProfilePicture,
		Gender:         formatter.GenderFormat(user.Gender),
		Location:       user.Location,
		Description:    user.Description,
		AccessToken:    token,
	}

	ctx.JSON(http.StatusOK, writer.APIResponse("User login successfully", true, loginResponse))
}

func (handler *Handler) HandleRegister(ctx *gin.Context) {
	var registerRequest auth.RegisterRequest

	// Validate user request payload
	if err := ctx.ShouldBindJSON(&registerRequest); err != nil {
		out := requestvalidator.Validate(err)
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIResponse("Validation error", false, out))
		return
	}

	// Call usecase to register the user
	user, err := handler.authUseCase.RegisterUser(ctx, registerRequest)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIErrorResponse("Something went wrong", err))
		return
	}

	// call usecase to generate access token
	token, err := handler.tokenUseCase.CreateAccessToken(ctx, user)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIErrorResponse("Something went wrong", err))
		return
	}

	// Mapping response from user data
	registerResponse := AuthResponse{
		FullName:       user.FullName,
		Email:          user.Email,
		ProfilePicture: user.ProfilePicture,
		Gender:         formatter.GenderFormat(user.Gender),
		Location:       user.Location,
		Description:    user.Description,
		AccessToken:    token,
	}

	ctx.JSON(http.StatusOK, writer.APIResponse("User register successfully", true, registerResponse))
}

func (handler *Handler) HandleUser(ctx *gin.Context) {
	user := ctx.MustGet("auth.user").(entity.User)

	// Mapping response from user data
	authResponse := AuthResponse{
		FullName:       user.FullName,
		Email:          user.Email,
		ProfilePicture: user.ProfilePicture,
		Gender:         formatter.GenderFormat(user.Gender),
		Location:       user.Location,
		Description:    user.Description,
	}

	ctx.JSON(http.StatusOK, writer.APIResponse("User information successfully", true, authResponse))
}
