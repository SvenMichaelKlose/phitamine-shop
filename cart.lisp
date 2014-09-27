;;;;; Copyright (c) 2012,2014 Sven Michael Klose <pixel@copei.de>

(define-template tpl-cart         :path "templates/cart.lisp")
(define-template tpl-cart-empty   :path "templates/cart-empty.lisp")
(define-template tpl-cart-item    :path "templates/cart-item.lisp")
(define-template tpl-cart-history :path "templates/cart-history.lisp")

(defun cart-find-article (id)
  (find-image `(id . ,id)))
