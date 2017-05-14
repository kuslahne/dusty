#lang racket

(require
    web-server/http
    web-server/http/id-cookie
    web-server/http/cookie-parse
    json

    "../config.rkt"
    "../utils/cookie.rkt"
    "../utils/tools.rkt"
    "../utils/email.rkt")

(provide
    user-get
    user-signin
    user-create
    user-options)


(define (user-get req)
    (define req-cookie (request-id-cookie 
        req 
        #:name "sessionId" 
        #:key secret-salt))

    (define cookies (request-cookies req))
    (displayln cookies)
    (displayln "####################################")
    (displayln req-cookie)

    (define success-rv (hash 'status "ok" 'user "ussusuusuu"))
    (jsonify success-rv))

(define (user-create req)
    (define success-rv (hash 'status "ok" 'create #t))
    (define faild-rv (hash 'status "ok" 'create #f))
    (jsonify success-rv))



(define (user-options req)
    (define success-rv (hash 'status "ok" 'login #t))
    (define faild-rv (hash 'status "ok" 'login #f))
    (jsonify success-rv))


(define (user-signin req)
    (define success-rv (hash 'status "ok" 'login #t))
    (define faild-rv (hash 'status "ok" 'login #f))
    (jsonify success-rv (list (make-session-cookie))))
