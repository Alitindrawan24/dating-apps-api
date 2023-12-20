package hasher

import (
	"crypto/sha256"
	"encoding/hex"
)

func SHA256(inputString string) string {
	// Create a new SHA-256 hasher
	hasher := sha256.New()

	// Write the string to the hasher
	hasher.Write([]byte(inputString))

	// Get the hashed bytes
	hashedBytes := hasher.Sum(nil)

	return hex.EncodeToString(hashedBytes)
}
