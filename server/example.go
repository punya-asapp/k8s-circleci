//go:generate protoc --twirp_out=. --go_out=. example.proto

package main

import (
	"context"
	"fmt"
	"net/http"
)

type server struct{}

func (server) AveragePrice(ctx context.Context, req *AveragePriceRequest) (*AveragePriceResponse, error) {
	return &AveragePriceResponse{AveragePrice: 42.0}, nil
}

func main() {
	s := NewSummarizerServer(server{}, nil)
	http.Handle(s.PathPrefix(), s)
	http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "ok")
	})
	http.ListenAndServe(":8080", nil)
}
