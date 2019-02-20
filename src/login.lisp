(define-template tpl-login :path "src/templates/navigation-login.lisp")

(define-redirect-catcher (logoutdone :status (lang de "Sie sind ausgeloggt."
                                                   en "You are logged out.")))
(set-action-group 'logoutdone 'login)

(define-redirect-catcher (logindone :status (when (logged-in?)
                                              (+ (lang de "Willkommen"
                                                       en "Welcome")
                                                 ", " (user-alias) "!"))))
(set-action-group 'logindone 'login)
