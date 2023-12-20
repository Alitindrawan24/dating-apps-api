package authenticator

import (
	"dating-apps-api/internal/pkg/writer"
	"net/http"
	"regexp"
	"strconv"

	"github.com/gin-gonic/gin"
)

// HandlePanic handle panic
func (middleware *Middleware) Authenticate() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		token := ctx.GetHeader("Authorization")

		// Define regex pattern to match token
		pattern := `^Bearer (\d+)\|([a-zA-Z0-9]+)$`
		regex := regexp.MustCompile(pattern)
		matches := regex.FindStringSubmatch(token)

		// Check if there was not 3 matches
		// matches[0] contains the full matched string
		// matches[1] contains the ID
		// matches[2] contains the Token
		if len(matches) != 3 {
			response := writer.APIResponse("Unauthorized", false, nil)
			ctx.AbortWithStatusJSON(http.StatusUnauthorized, response)
			return
		}

		ID, _ := strconv.Atoi(matches[1])
		accessToken := matches[2] // Access token

		// Validate the access token
		user, err := middleware.tokenUseCase.ValidateAccessToken(ctx, int64(ID), accessToken)
		if err != nil {
			response := writer.APIResponse("Unauthorized", false, nil)
			ctx.AbortWithStatusJSON(http.StatusUnauthorized, response)
			return
		}

		ctx.Set("auth.user", user)

		ctx.Next()
	}
}
