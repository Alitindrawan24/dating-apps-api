package random

import (
	"math/rand"
	"time"
)

func GenerateRandomString(length int) string {
	characters := []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
	randomizer := rand.New(rand.NewSource(time.Now().UTC().UnixNano()))

	b := make([]rune, length)
	for i := range b {
		b[i] = characters[randomizer.Intn(len(characters))]
	}
	return string(b)
}
