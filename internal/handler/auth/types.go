package auth

type AuthResponse struct {
	FullName       string `json:"full_name"`
	Email          string `json:"email"`
	ProfilePicture string `json:"profile_picture"`
	Gender         string `json:"gender"`
	Location       string `json:"location"`
	Description    string `json:"description"`
	AccessToken    string `json:"access_token,omitempty"`
}
