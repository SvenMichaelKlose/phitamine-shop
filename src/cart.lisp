(define-template tpl-cart         :path "src/templates/cart.lisp")
(define-template tpl-cart-empty   :path "src/templates/cart-empty.lisp")
(define-template tpl-cart-item    :path "src/templates/cart-item.lisp")
(define-template tpl-cart-history :path "src/templates/cart-history.lisp")

(fn cart-find-article (id)
  (find-image (. 'id id)))
