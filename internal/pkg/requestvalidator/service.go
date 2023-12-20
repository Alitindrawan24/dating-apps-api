package requestvalidator

import (
	"errors"

	"github.com/go-playground/validator/v10"
)

type ErrorMsg struct {
	Field   string `json:"field"`
	Message string `json:"message"`
}

func Validate(err error) []ErrorMsg {
	var ve validator.ValidationErrors
	if errors.As(err, &ve) {
		out := make([]ErrorMsg, len(ve))
		for i, fe := range ve {
			out[i] = ErrorMsg{fe.Field(), getErrorMsg(fe)}
		}

		return out
	}

	return []ErrorMsg{}
}

func getErrorMsg(fe validator.FieldError) string {
	switch fe.Tag() {
	case "required":
		return "This field is required"
	case "email":
		return "Email format is not valid"
	case "max":
		return "This field characters Should be equal or less than " + fe.Param()
	case "min":
		return "This field characters Should be equal or more than " + fe.Param()
	case "eqfield":
		return "This field should be equal to field " + fe.Param()
	case "oneof":
		return "This field should contains one of " + fe.Param()
	}
	return "Unknown error"
}
