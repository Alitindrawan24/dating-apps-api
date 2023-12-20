package panichandler

import (
	"dating-apps-api/internal/pkg/writer"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

// HandlePanic handle panic
func (middleware *Middleware) HandlePanic() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		defer func() {
			// Recover the panic if exists
			recover := recover()
			if recover == nil {
				return
			}

			errMsg := fmt.Sprintf("%v", recover)
			fmt.Println(errMsg) // Can be replaced with logging
			ctx.AbortWithStatusJSON(http.StatusBadGateway, writer.APIResponse("Something went wrong", false, nil))
		}()

		ctx.Next()
	}
}
