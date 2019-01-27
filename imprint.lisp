(define-template tpl-imprint :path "templates/imprint.lisp")

(fn imprint (x)
  (= (page-title) (lang de "Impressum" en "Imprint"))
  (set-port
    (tpl-imprint))
  1)

(define-action imprint)
