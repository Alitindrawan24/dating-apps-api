package config

import (
	"os"
	"testing"
)

func setup() {
	// Set the environment variable for testing
	os.Setenv("KEY", "SECRET")
}

func teardown() {
	// Clean up by unsetting the environment variable
	os.Unsetenv("KEY")
}

func TestMain(m *testing.M) {
	// Run setup before running tests
	setup()

	// Run the tests
	code := m.Run()

	// Run teardown after running tests
	teardown()

	// Exit with the test result code
	os.Exit(code)
}

func TestGet(t *testing.T) {
	type args struct {
		key string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: "Case success - key exists",
			args: args{
				key: "KEY",
			},
			want: "SECRET",
		},
		{
			name: "Case success - key not exists",
			args: args{
				key: "KEY2",
			},
			want: "",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Get(tt.args.key); got != tt.want {
				t.Errorf("Get() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestGetWIthDefault(t *testing.T) {
	type args struct {
		key          string
		defaultValue string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: "case success - key exists",
			args: args{
				key:          "KEY",
				defaultValue: "value",
			},
			want: "SECRET",
		},
		{
			name: "case success - key not exists",
			args: args{
				key:          "KEY2",
				defaultValue: "value",
			},
			want: "value",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := GetWIthDefault(tt.args.key, tt.args.defaultValue); got != tt.want {
				t.Errorf("GetWIthDefault() = %v, want %v", got, tt.want)
			}
		})
	}
}
