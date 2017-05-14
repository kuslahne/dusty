#lang racket

(require
    web-server/dispatch

    "handlers/user.rkt"
    "handlers/chart.rkt"
    "handlers/index.rkt"
    "handlers/errors.rkt")


(provide api-dispatch)

(define-values (api-dispatch api-url)
    (dispatch-rules
    [("") index]
    [("user") #:method (or "get" "options") user-get]
    [("user") #:method (or "post" "options") user-create]
    
    [("signin") #:method "options" user-options]
    [("signin") #:method "post" user-signin]
    [else not-found]))