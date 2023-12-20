package auth

type RegisterRequest struct {
	Email                string `json:"email" binding:"required,email,max=255"`
	FullName             string `json:"full_name" binding:"required,max=255"`
	Gender               string `json:"gender" binding:"required,max=255"`
	DateOfBirth          string `json:"date_of_birth" binding:"required"`
	Location             string `json:"location" binding:"required,max=255"`
	Description          string `json:"description" binding:"required,max=65535"`
	Password             string `json:"password" binding:"required,min=8,max=255"`
	PasswordConfirmation string `json:"password_confirmation" binding:"required,min=8,max=255,eqfield=Password"`
}

type LoginRequest struct {
	Email    string `json:"email" binding:"required,email,max=255"`
	Password string `json:"password" binding:"required,min=8,max=255"`
}
