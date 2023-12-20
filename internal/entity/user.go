package entity

import "time"

type User struct {
	ID             int64
	Email          string
	FullName       string
	ProfilePicture string
	Gender         string
	DateOfBirth    string
	Location       string
	Description    string
	Password       string
	IsPremium      bool
	CreatedAt      time.Time
	UpdatedAt      time.Time
}
