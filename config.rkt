#lang web-server
(require 
        web-server/http/id-cookie)

(provide 
    log-file
    server-root-path
    port
    is-stateless
    secret-salt
    servlet-regexp)

(define secret-salt (make-secret-salt/file "./cookie.key"))



(define log-file "app.log") ;日志文件

(define server-root-path ".") ;项目目录

(define port 8089) ; 端口

(define is-stateless #t) ; 无状态服务

(define servlet-regexp #rx"") ; 路径正则
