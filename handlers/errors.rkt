#lang racket

(require
    web-server/http)

(provide not-found)


(define (not-found req)
  (response/xexpr
   `(html (head (title "Hello world!"))
          (body (h1 "404!")))))