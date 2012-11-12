;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *navi-status*   nil)

(define-template tpl-navigation-login   :path "tpl/navigation-logged-in.lisp")
(define-template tpl-navigation-nologin :path "tpl/navigation-not-logged-in.lisp")
(define-template tpl-navigation-contact :path "tpl/navigation-contact.lisp")
(define-template tpl-navigation-upload  :path "tpl/navigation-upload.lisp")

(defvar *navi-groups* '(login contact gallery-upload cart))
(dolist (i *navi-groups*)
  (= (group-port i) 'navi))

(defun navi-url (&optional (x nil))
  (action-url (components-w/o-port 'navi) :add x))

(defun navi-status (&key (class nil))
  (& (| *navi-status* *login-status*)
     `((p ,@(!? class `(:class ,!))
         ,(| *navi-status* "")
         ,(| *login-status* "")))))

(defun tpl-navigation ()
  (funcall (? (logged-in?)
              #'tpl-navigation-login
              #'tpl-navigation-nologin)
           (list (cons 'link-home    (action-url *home-components*))
                 (cons 'link-login   (navi-url 'login))
                 (cons 'link-logout  (navi-url 'logout))
                 (cons 'link-cart    (navi-url 'cart))
                 (cons 'link-contact (navi-url 'contact))
                 (cons 'link-upload  (navi-url 'upload-images))
                 (cons 'link-imprint (action-url (components-w/o-port 'content) :add 'imprint))
                 (cons 'alias        (user-alias)))))

(request-port 'navi #'tpl-navigation)
