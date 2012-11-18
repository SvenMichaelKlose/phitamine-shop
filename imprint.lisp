;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-template tpl-imprint :path "templates/imprint.lisp")

(defun imprint (x)
  (set-port
    (= (page-title) (lang de "Impressum" en "Imprint"))
    (tpl-imprint))
  1)

(define-action imprint)
