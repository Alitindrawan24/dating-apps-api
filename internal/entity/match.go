package entity

import "time"

type Match struct {
	UUID      string
	UserID    int64
	TargetID  int64
	Status    int8
	CreatedAt time.Time
}
