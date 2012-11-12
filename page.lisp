;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *page-title*    nil)
(defvar *js-jqzoom*     ,(concat-stringtree (with-open-file in (open "tpl/jqzoom.js" :direction 'input) (read-all-lines in))))

(define-template tpl-main               :path "tpl/main.lisp")

(defun page-title ()       *page-title*)
(defun (= page-title) (x)  (= *page-title* (+ "Shop Hope Stamps &#8208 " x)))
