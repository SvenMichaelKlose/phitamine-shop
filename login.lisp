;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-template tpl-login :path "tpl/navigation-login.lisp")

(defun user-id ()    (session :id))
(defun user-alias () (session :alias))
(defun logged-in? () (user-id))

(define-redirect-catcher (logoutdone :status (lang de "Sie sind ausgeloggt."
                                                   en "You are logged out.")))

(defun logout ()
  (session_destroy)
  (= (session :id)    nil)
  (= (session :alias) nil)
  (request-action-redirect "logoutdone"))

(define-redirect-catcher (logindone :status (+ (lang de "Willkommen"
                                                     en "Welcome")
                                               ", " (user-alias) "!")))

(defun login-ok (user)
  (= *navi-template*  nil)
  (= (session :id)    (assoc-value :id user))
  (= (session :alias) (assoc-value :alias user))
  (request-action-redirect "logindone"))

(defun encrypt-password (x)
  (areplace x (list (cons :password (md5 (assoc-value :password x))))))

(defun process-login ()
  (let data (encrypt-password (form-data))
    (!? (find-user data)
        (login-ok !)
        (= *navi-status* (lang de "Dieser Benutzer ist uns nicht bekannt oder das Passwort stimmt nicht."
                               en "Sorry, but the username or password is incorrect.")))))

(defun login ()
  (= *navi-template* #'tpl-login)
  (?
    (form-complete?) (process-login)
    (has-form?)      (= *navi-status* (lang de "Das Formular ist unvollst&auml;ndig."
                                            en "Sorry, but the form is incomplete."))))

(define-navi-action login)
(define-navi-action logout)
