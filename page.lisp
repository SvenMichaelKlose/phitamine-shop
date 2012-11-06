;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *page-title* nil)
(defvar *navi-template* nil)
(defvar *navi-status* nil)

(define-template tpl-navigation-login   :path "tpl/navigation-logged-in.lisp")
(define-template tpl-navigation-nologin :path "tpl/navigation-not-logged-in.lisp")
(define-template tpl-navigation-contact :path "tpl/navigation-contact.lisp")
(define-template tpl-navigation-upload  :path "tpl/navigation-upload.lisp")
(define-template tpl-main               :path "tpl/main.lisp")

(defun navi-template (x)
  (funcall x (list (cons :link-home (action-url *home-action*))
                   (cons :link-login (action-url t :params '((action . "login"))))
                   (cons :link-logout (action-url t :params '((action . "logout"))))
                   (cons :link-cart (action-url t :params '((action . "cart"))))
                   (cons :link-contact (action-url t :params '((action . "contact"))))
                   (cons :link-upload (action-url t :params '((action . "upload-images"))))
                   (cons :link-imprint (action-url 'imprint))
                   (cons :alias (user-alias)))))

(defun navi-status (&key (class nil))
  (!? *navi-status*
    `((p ,@(!? class `(:class ,!))
        ,!))))

(defun navigation ()
  (navi-template
      (| *navi-template*
         (? (logged-in?)
            #'tpl-navigation-login
            #'tpl-navigation-nologin))))

(defmacro define-page (name &key path)
  (print-definition `(define-page ,name :path ,path))
  (let content-template ($ name '-0)
    `(progn
       (define-template ,content-template :path ,path)
       (defun ,name (&rest content-params)
         (+ "<!DOCTYPE HTML>" (terpri nil)
            (tpl-main (list (cons :navi (navigation))
                            (cons :content (apply #',content-template content-params))))
            "<!-- pixel was here -->")))))

(defun navi-reset-url ()
  (action-url t :params (aremove :action (request-data))))

(defvar *navi-actions* nil)

(defmacro define-navi-action (x)
  `(acons! ',x #',x *navi-actions*))

(defun call-navi-action (x)
  (funcall (assoc-value (make-symbol (string-upcase x)) *navi-actions*)))

(defun page-title ()
  *page-title*)

(defun (= page-title) (x)
  (= *page-title* (+ "Shop Hope Stamps &#8208 " x)))
