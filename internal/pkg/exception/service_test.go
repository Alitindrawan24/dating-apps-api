package exception

import (
	"errors"
	"reflect"
	"testing"
)

func TestNew(t *testing.T) {
	type args struct {
		message string
	}
	tests := []struct {
		name string
		args args
		want ExceptionContract
	}{
		{
			name: "case success",
			args: args{
				message: "this is a error",
			},
			want: New("this is a error"),
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := New(tt.args.message); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("New() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestWrap(t *testing.T) {
	type args struct {
		cause error
	}
	tests := []struct {
		name string
		args args
		want ExceptionContract
	}{
		{
			name: "case success",
			args: args{
				cause: errors.New("this is a error"),
			},
			want: Wrap(errors.New("this is a error")),
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Wrap(tt.args.cause); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("Wrap() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestException_Error(t *testing.T) {
	type fields struct {
		err error
	}
	tests := []struct {
		name   string
		fields fields
		want   string
	}{
		{
			name: "case success",
			fields: fields{
				err: errors.New("this is a error"),
			},
			want: "this is a error",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			e := &Exception{
				err: tt.fields.err,
			}
			if got := e.Error(); got != tt.want {
				t.Errorf("Exception.Error() = %v, want %v", got, tt.want)
			}
		})
	}
}
