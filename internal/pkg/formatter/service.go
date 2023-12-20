package formatter

func GenderFormat(gender string) string {
	if gender == "m" {
		return "male"
	} else if gender == "f" {
		return "female"
	} else {
		return "unknown"
	}
}
