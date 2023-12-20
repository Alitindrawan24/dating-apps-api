package match

type MatchRequest struct {
	MatchID string `json:"match_id" binding:"required,uuid"`
	Swipe   string `json:"swipe" binding:"required,oneof=left right"`
}
