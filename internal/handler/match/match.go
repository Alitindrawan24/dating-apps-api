package match

import (
	"dating-apps-api/internal/entity"
	"dating-apps-api/internal/pkg/formatter"
	"dating-apps-api/internal/pkg/requestvalidator"
	"dating-apps-api/internal/pkg/writer"
	"dating-apps-api/internal/usecase/match"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func (handler *Handler) HandleGetMatch(ctx *gin.Context) {
	user := ctx.MustGet("auth.user").(entity.User)

	// call usecase to get user profile
	targetUser, err := handler.matchUseCase.GetUserProfile(ctx, user)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIErrorResponse("Something went wrong", err))
		return
	}

	// Handle if not available profile
	if targetUser.ID == 0 {
		ctx.JSON(http.StatusOK, writer.APIResponse("There is no available profile", true, nil))
		return
	}

	// Create User match
	match, err := handler.matchUseCase.CreateUserMatch(ctx, user.ID, targetUser.ID)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIErrorResponse("Something went wrong", err))
		return
	}

	// Mapping response from user data
	profileResponse := ProfileResponse{
		MatchID:        match.UUID,
		FullName:       targetUser.FullName,
		ProfilePicture: targetUser.ProfilePicture,
		Age:            formatter.AgeFormat(targetUser.DateOfBirth),
		Gender:         formatter.GenderFormat(targetUser.Gender),
		Location:       targetUser.Location,
		Description:    targetUser.Description,
	}

	ctx.JSON(http.StatusOK, writer.APIResponse("Get match successfully", true, profileResponse))
}

func (handler *Handler) HandleStoreMatch(ctx *gin.Context) {

	var matchRequest match.MatchRequest

	// Validate user request payload
	if err := ctx.ShouldBindJSON(&matchRequest); err != nil {
		out := requestvalidator.Validate(err)
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIResponse("Validation error", false, out))
		return
	}

	// Store User match
	err := handler.matchUseCase.StoreUserMatch(ctx, matchRequest)
	if err != nil {
		fmt.Println(err.Error()) // Can be replaced by logging
		ctx.AbortWithStatusJSON(http.StatusBadRequest, writer.APIErrorResponse("Something went wrong", err))
		return
	}

	ctx.JSON(http.StatusOK, writer.APIResponse("Store match successfully", true, nil))
}
