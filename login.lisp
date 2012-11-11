;;;;; Centralservices – Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *login-status* nil)

(define-template tpl-login :path "tpl/navigation-login.lisp")

(defun user-id ()    (session 'id))
(defun user-alias () (session 'alias))
(defun logged-in? () (user-id))

(defun logout (x)
  (session_destroy)
  (= (session 'id)    nil)
  (= (session 'alias) nil)
  (action-redirect :add 'logoutdone))

(defun login-ok (user)
  (= (session 'id)    (assoc-value 'id user))
  (= (session 'alias) (assoc-value 'alias user))
  (action-redirect :add 'logindone))

(defun encrypt-password (x)
  (areplace x (list (cons 'password (md5 (assoc-value 'password x))))))

(defun process-login ()
  (!? (find-user (encrypt-password (form-data)))
      (login-ok !)
      (= *login-status* (lang de "Dieser Benutzer ist uns nicht bekannt oder das Passwort stimmt nicht."
                              en "Sorry, but the username or password is incorrect."))))

(defun login (x)
  (?
    (form-complete?) (process-login)
    (has-form?)      (= *login-status* (lang de "Das Formular ist unvollst&auml;ndig."
                                             en "Sorry, but the form is incomplete.")))
  (set-port (tpl-login))
  t)

(define-action login  :group login)
(define-action logout :group login)





; (set-action-port 'login 'navi)

; XXX move to app
(define-redirect-catcher (logoutdone :status (lang de "Sie sind ausgeloggt."
                                                   en "You are logged out.")))


; XXX move to app
(define-redirect-catcher (logindone :status (+ (lang de "Willkommen"
                                                     en "Welcome")
                                               ", " (user-alias) "!")))
