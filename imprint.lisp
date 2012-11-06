;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-page tpl-imprint :path "tpl/imprint.lisp")

(defun imprint (n x)
  (set-action
    (= (page-title) (lang de "Impressum" en "Imprint"))
    (tpl-imprint))
  (keep-components n)
  x)

(define-action imprint)
