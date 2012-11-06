;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun init-shophope ()
  (= *home-action* '(gallery "1"))
  (= *default-action* #'tpl-error-404))

(define-page tpl-error-404 :path "tpl/error-404.lisp")

(init-shophope)
(phitamine)
