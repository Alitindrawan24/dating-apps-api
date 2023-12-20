package match

type ProfileResponse struct {
	MatchID        string `json:"match_id"`
	FullName       string `json:"full_name"`
	ProfilePicture string `json:"profile_picture"`
	Age            int    `json:"age"`
	Gender         string `json:"gender"`
	Location       string `json:"location"`
	Description    string `json:"description"`
}
