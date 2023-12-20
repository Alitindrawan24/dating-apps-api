package writer

import (
	"dating-apps-api/internal/pkg/exception"
	"errors"
)

type Response struct {
	Status  bool   `json:"status"`
	Message string `json:"message"`
	Data    any    `json:"data,omitempty"`
	Error   any    `json:"error,omitempty"`
}

func APIResponse(message string, status bool, data any) Response {
	jsonResponse := Response{
		Status:  status,
		Message: message,
		Data:    data,
	}

	if !status {
		jsonResponse.Data = nil
		jsonResponse.Error = data
	}

	return jsonResponse
}

func APIErrorResponse(message string, err error) Response {

	var exception *exception.Exception
	if errors.As(err, &exception) {
		message = err.Error()
	}

	jsonResponse := Response{
		Status:  false,
		Message: message,
	}

	return jsonResponse
}
