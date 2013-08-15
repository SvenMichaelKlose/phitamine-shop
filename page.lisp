;;;;; Copyright (c) 2012–2013 Sven Michael Klose <pixel@copei.de>

(defvar *page-title*)
(defvar *page-status* nil)

(defvar *js-jqzoom* ,(concat-stringtree (with-open-file in (open "templates/jqzoom.js" :direction 'input) (read-all-lines in))))

(define-template tpl-main :path "templates/main.lisp")

(defun page-title ()       *page-title*)
(defun (= page-title) (x)  (= *page-title* (+ "Shop Hope Stamps" (? x (+ " &#8208; " x) ""))))
(= (page-title) nil)

(def-pagination pagination-title (pagination)
  (+ " &#8208; "
     (lang de "Seite "
           en "Page ")
     page
     (lang de " von " en " of ")
     (pagination-pages pagination)))

(defun page-status ()       *page-status*)
(defun (= page-status) (x)  (= *page-status* `(,x)))

(defun url (x)
  (+ *base-url* x))
