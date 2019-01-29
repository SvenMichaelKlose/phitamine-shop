(define-template tpl-cart         :path "templates/cart.lisp")
(define-template tpl-cart-empty   :path "templates/cart-empty.lisp")
(define-template tpl-cart-item    :path "templates/cart-item.lisp")
(define-template tpl-cart-history :path "templates/cart-history.lisp")

(fn cart-find-article (id)
  (find-image (. 'id id)))
