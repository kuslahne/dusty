#lang racket

(require 
  web-server/http
  json
  web-server/http/request-structs

  "cookie.rkt")

(provide jsonify)

(define default-headers (list
                    (make-header #"Access-Control-Allow-Origin" #"http://localhost:3000")
                    (make-header #"Access-Control-Allow-Credentials" #"true")
                    (make-header #"Access-Control-Allow-Headers" #"*")
                    (make-header #"Access-Control-Allow-Headers" #"Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers")
                ))


; (define (jsonify args)
(define (jsonify args [cookies-list '()])

  (define json-rv (with-output-to-string
    (λ () (write-json args))))
  
  ; (define cookies-list (list (
  ;   make-arrow-cookie)))
  
  ; (if (boolean? cookies)
  ;   (void)
  ;   (set! cookies-list (append cookies-list cookies)))


  (define cookie  (make-arrow-cookie))

  (if (= (length cookies-list) 0)
    (set! cookies-list (list cookie))
    ; (set! cookies-list cookies-list)
    (void)
  )

  ; (displayln (length cookies-list))
  ; (displayln cookies-list)

  (response/xexpr
        #:cookies cookies-list
        #:headers default-headers
        #:mime-type #"application/json"
        json-rv))
