;;;;; Centralservices – Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-redirect-catcher (logoutdone :status (lang de "Sie sind ausgeloggt."
                                                   en "You are logged out.")))
(set-action-group 'logoutdone 'login)

(define-redirect-catcher (logindone :status (+ (lang de "Willkommen"
                                                     en "Welcome")
                                               ", " (user-alias) "!")))
(set-action-group 'logindone 'login)
