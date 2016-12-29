; Copyright (c) 2012–2014,2016 Sven Michael Klose <pixel@copei.de>

(defvar *page-title*)
(defvar *page-status* nil)

(defvar *js-jqzoom* ,(concat-stringtree (with-open-file in (open "templates/jqzoom.js" :direction 'input) (read-all-lines in))))

(define-template tpl-main :path "templates/main.lisp")

(defun page-title ()       *page-title*)
(defun (= page-title) (x)  (= *page-title* (+ "Phitamine Shop" (? x (+ " &#8208; " x) ""))))
(= (page-title) nil)

(defun pagination-title (pagination)
  (with (from  (pagination-from pagination)
         to    (pagination-to pagination))
    (+ (? (== to from)
          (pagination-page pagination)
          (+ from "&#8208;" to))
       (lang en " of "
             de " von ")
       (pagination-total pagination))))

(defun page-status ()       *page-status*)
(defun (= page-status) (x)  (= *page-status* `(,x)))

(defun url (x)
  (string-concat *base-url* x))
