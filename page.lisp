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

(defun navi-status (&key (class nil))
  (& (| *navi-status* *login-status*)
     `((p ,@(!? class `(:class ,!))
         ,(| *navi-status* "")
         ,(| *login-status* "")))))

(defun navi-template (x)
  (funcall x (list (cons 'link-home    (action-url *home-components*))
                   (cons 'link-login   (action-url :add 'login))
                   (cons 'link-logout  (action-url :add 'logout))
                   (cons 'link-cart    (action-url :add 'cart))
                   (cons 'link-contact (action-url :add 'contact))
                   (cons 'link-upload  (action-url :add 'upload-images))
                   (cons 'link-imprint (action-url 'imprint))
                   (cons 'alias        (user-alias)))))

(defun navigation ()
  (navi-template (? (logged-in?)
                    #'tpl-navigation-login
                    #'tpl-navigation-nologin)))

(defun navi-reset-url ()
  (action-url (remove-if [eq 'navi (component-port _.)] *components*)))

(defun page-title ()      *page-title*)
(defun (= page-title) (x) (= *page-title* (+ "Shop Hope Stamps &#8208 " x)))

(= (group-port 'login)   'navi)
(= (group-port 'contact) 'navi)
(= (group-port 'upload)  'navi)
(= (group-port 'cart)    'navi)
(request-port 'navi #'navigation)
