package formatter

import (
	"strings"
	"time"
)

func GenderFormat(gender string) string {
	if gender == "m" {
		return "male"
	} else if gender == "f" {
		return "female"
	} else {
		return "unknown"
	}
}

func AgeFormat(dateOfBirth string) int {
	birthDate, _ := time.Parse("2006-01-02", strings.Split(dateOfBirth, "T")[0])
	ageDuration := time.Since(birthDate)
	ageInYears := int(ageDuration.Hours() / 24 / 365.25)

	return ageInYears
}
