;;;;; Copyright (c) 2012,2014 Sven Michael Klose <pixel@copei.de>

(define-template tpl-cart         :path "templates/cart.lisp")
(define-template tpl-cart-empty   :path "templates/cart-empty.lisp")
(define-template tpl-cart-item    :path "templates/cart-item.lisp")
(define-template tpl-cart-history :path "templates/cart-history.lisp")

(defun cart-current ()      (!?   (session 'cart)      (phphash-alist !)))
(defun cart-undos ()        (!?   (session 'cart-undo) (array-list !)))
(defun cart-redos ()        (!?   (session 'cart-redo) (array-list !)))
(defun (= cart-current) (x) (=    (session 'cart)      (alist-phphash x)))
(defun (= cart-undos) (x)   (=    (session 'cart-undo) (list-phphash x)))
(defun (= cart-redos) (x)   (=    (session 'cart-redo) (list-phphash x)))
(defun cart-add-undo ()     (push (session 'cart)      (cart-undos)))
(defun cart-add-redo ()     (push (session 'cart)      (cart-redos)))
(defun cart-pop-undo ()     (=    (session 'cart)      (pop (cart-undos))))
(defun cart-pop-redo ()     (=    (session 'cart)      (pop (cart-redos))))

(defun cart-num-undos ()    (length (session 'cart-undo)))
(defun cart-num-redos ()    (length (session 'cart-redo)))
(defun cart-has-undo? ()    (not (zero? (cart-num-undos))))
(defun cart-has-redo? ()    (not (zero? (cart-num-redos))))

(defun cart-item (x)
  (assoc x (cart-current) :test #'string==))

(defun has-cart? ()
  (not (zero? (length (cart-current)))))

(defmacro filter-cart (&rest body)
  `(= (cart-current) (filter [,@body] (cart-current))))

(defun cart-redirect ()
  (action-redirect :update 'cart))

(defun cart-undo (x)
  (cart-add-redo)
  (cart-pop-undo)
  (cart-redirect)
  .x)

(defun cart-redo (x)
  (cart-add-undo)
  (cart-pop-redo)
  (cart-redirect)
  .x)

(defun cart-remove (x)
  (cart-add-undo)
  (= (cart-current) (aremove .x. (cart-current) :test #'string==))
  (cart-redirect))

(defun cart-add (x)
  (cart-add-undo)
  (let id (number (request 'id))
    (!? (cart-item id)
        (filter-cart (? (== _. id)
                        (cons _. (++ ._))
                        _))
        (acons! .x. 1 (cart-current))))
  (cart-redirect))

(defun cart-price-total ()
  (let total 0
    (dolist (i (cart-current) total)
      (+! total (number (assoc-value 'price (find-image `(id . ,i.))))))))

(defun cart-items ()
  (template-list #'tpl-cart-item (filter [find-image `(id . ,_.)] (cart-current))))

(defun cart-num-items ()
  (length (cart-current)))

(defun cart-item-count (id)
  (assoc-value id (cart-current) :test #'==))

(defun cart-update-item (x)
  (filter-cart (? (string== _. (assoc-value 'id x :test #'string==))
                  (. _. (assoc-value 'n x :test #'string==))
                  _)))

(defun cart-update ()
  (when (has-form?)
    (cart-add-undo)
    (filter #'cart-update-item (form-alists))
    (action-redirect)))

(defun cart (x)
  (set-port
;    (cart-update)
    (? (has-cart?)
       (tpl-cart)
       (tpl-cart-empty)))
  1)

(defmacro define-cart-action (name)
  `(define-action ,name :group cart))

(define-cart-action cart)
(define-cart-action cart-add)
(define-cart-action cart-remove)
(define-cart-action cart-undo)
(define-cart-action cart-redo)
