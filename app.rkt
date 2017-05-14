#lang web-server

(require
    web-server/http
    web-server/servlet-env

    "routers.rkt"
    "config.rkt")


(define (app req)
    (api-dispatch req))
 
; (define (app req)
;   (match (request->basic-credentials req)
;     [(cons user pass)
;      (api-dispatch req)]
;     [else
;      (response
;       401 #"Unauthorized" (current-seconds) TEXT/HTML-MIME-TYPE
;       (list
;        (make-basic-auth-header
;         (format "Basic Auth Test: ~a" (gensym))))
;       void)]))



(serve/servlet app
    #:log-file log-file
    #:server-root-path server-root-path
    #:stateless? is-stateless
    #:port port
    #:servlet-regexp servlet-regexp
    #:launch-browser? #f)