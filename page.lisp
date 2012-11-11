;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *page-title*    nil)
(defvar *navi-template* nil)
(defvar *navi-status*   nil)
(defvar *js-jqzoom*     ,(concat-stringtree (with-open-file in (open "tpl/jqzoom.js" :direction 'input) (read-all-lines in))))

(define-template tpl-navigation-login   :path "tpl/navigation-logged-in.lisp")
(define-template tpl-navigation-nologin :path "tpl/navigation-not-logged-in.lisp")
(define-template tpl-navigation-contact :path "tpl/navigation-contact.lisp")
(define-template tpl-navigation-upload  :path "tpl/navigation-upload.lisp")
(define-template tpl-main               :path "tpl/main.lisp")

(defun navi-url (&optional (x nil))
  (action-url (components-w/o-port 'navi) :add x))

(defun navi-status (&key (class nil))
  (& (| *navi-status* *login-status*)
     `((p ,@(!? class `(:class ,!))
         ,(| *navi-status* "")
         ,(| *login-status* "")))))

(defun navi-template (x)
  (funcall x (list (cons 'link-home    (action-url *home-components*))
                   (cons 'link-login   (navi-url 'login))
                   (cons 'link-logout  (navi-url 'logout))
                   (cons 'link-cart    (navi-url 'cart))
                   (cons 'link-contact (navi-url 'contact))
                   (cons 'link-upload  (navi-url 'upload-images))
                   (cons 'link-imprint (action-url (components-w/o-port 'content) :add 'imprint))
                   (cons 'alias        (user-alias)))))

(defun navigation ()
  (navi-template (? (logged-in?)
                    #'tpl-navigation-login
                    #'tpl-navigation-nologin)))

(defun page-title ()      *page-title*)
(defun (= page-title) (x) (= *page-title* (+ "Shop Hope Stamps &#8208 " x)))

(= (group-port 'login)   'navi)
(= (group-port 'contact) 'navi)
(= (group-port 'upload)  'navi)
(= (group-port 'cart)    'navi)
(request-port 'navi #'navigation)
