#lang racket

(require
    web-server/http)

(provide index)

(define (index req)
  (response/xexpr 
      #:mime-type #"application/json"
      "{hello: API}"))