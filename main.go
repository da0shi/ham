package main

import (
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
)

type ResponseWriter struct {
	http.ResponseWriter
	status int
	length int
}

func (rw *ResponseWriter) WriteHeader(status int) {
	rw.status = status
	rw.ResponseWriter.WriteHeader(status)
}
func (rw *ResponseWriter) Write(b []byte) (int, error) {
	if rw.status == 0 {
		rw.status = 200
	}
	n, err := rw.ResponseWriter.Write(b)
	rw.length += n
	return n, err
}

func LoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		start := time.Now()
		rw := ResponseWriter{ResponseWriter: w}
		next.ServeHTTP(&rw, r)
		end := time.Now()
		log.Printf("[%d] %d \"%s %s %s\" %s %s\n", start.Unix(), rw.status, r.Method, r.URL, r.Proto, r.Host, end.Sub(start))
	})
}

func main() {
	r := mux.NewRouter().PathPrefix("/").Subrouter()
	r.Use(LoggingMiddleware)
	r.HandleFunc("/ping", PingHandler).Methods(http.MethodGet)

	log.Println("Starting server...")
	log.Fatal(http.ListenAndServe("localhost:8080", r))
}

func PingHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "pong")
}
