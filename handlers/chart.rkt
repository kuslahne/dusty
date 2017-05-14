#lang racket

(require
    web-server/http)

(provide chart)

(define (chart req)
  (response/xexpr
      #:mime-type #"application/json"
      "{hello: Chart}"))
