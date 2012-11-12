;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-template tpl-navigation-login   :path "tpl/navigation-logged-in.lisp")
(define-template tpl-navigation-nologin :path "tpl/navigation-not-logged-in.lisp")
(define-template tpl-navigation-contact :path "tpl/navigation-contact.lisp")
(define-template tpl-navigation-upload  :path "tpl/navigation-upload.lisp")

(defvar *navi-groups* '(login contact gallery-upload cart))
(dolist (i *navi-groups*)
  (= (group-port i) 'navi))

(defun navi-url (&optional (x nil))
  (action-url (components-w/o-port 'navi) :add x))

(defun tpl-navigation ()
  (funcall (? (logged-in?)
              #'tpl-navigation-login
              #'tpl-navigation-nologin)
           `((link-home    . ,(action-url *home-components*))
             (link-login   . ,(navi-url 'login))
             (link-logout  . ,(navi-url 'logout))
             (link-cart    . ,(navi-url 'cart))
             (link-contact . ,(navi-url 'contact))
             (link-upload  . ,(navi-url 'upload-images))
             (link-imprint . ,(action-url (components-w/o-port 'content) :add 'imprint))
             (alias        . ,(user-alias)))))

(request-port 'navi #'tpl-navigation)
