#lang racket

(require
    web-server/http/id-cookie
    web-server/http/cookie
    "../config.rkt")

(define key (make-secret-salt/file "./cookie.key"))

(provide 
    make-arrow-cookie
    make-session-cookie)

(define candidates "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

(define (make-random-value) 
  (apply 
   string 
   (for/list ([i (in-range (random 100))]) 
     (string-ref candidates (random (string-length candidates))))))

(define (make-arrow-cookie)
    (make-id-cookie	
        "arrow"
        key
        (make-random-value)
        #:path "/"

       	#:http-only? #f
        #:max-age 100000
        #:secure? #f))


(define (make-session-cookie)
    (make-id-cookie	
        "sessionId"
        key

        (make-random-value)
        #:http-only? #f
        #:secure? #f))