;;;;; Copyright (c) 2012–2013 Sven Michael Klose <pixel@copei.de>

(define-template tpl-imprint :path "templates/imprint.lisp")

(defun imprint (x)
  (= (page-title) (lang de "Impressum" en "Imprint"))
  (set-port
    (tpl-imprint))
  1)

(define-action imprint)
