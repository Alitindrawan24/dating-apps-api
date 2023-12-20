package entity

import (
	"time"
)

type AccessToken struct {
	ID        int64
	UserID    int64
	Token     string
	CreatedAt time.Time
	User      User
}
