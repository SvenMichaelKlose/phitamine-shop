;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *gallery-page-size* 12)

(define-template tpl-gallery-index       :path "gallery/tpl/index.lisp")
(define-template tpl-gallery-empty       :path "gallery/tpl/empty.lisp")
(define-template tpl-gallery-image       :path "gallery/tpl/image.lisp")
(define-template tpl-gallery-image-form  :path "gallery/tpl/image-form.lisp")

; XXX doesn't quasiquote properly in backquote with pairs in COMPILE-BACKQUOTE.
(defun make-image (pagination img)
  (funcall (? (logged-in?) ;(== (user-id) (assoc-value 'id_user img)))
              #'tpl-gallery-image-form
              #'tpl-gallery-image)
           (+ `((image-src        . ,(thumbnail-src img))
                (link-image-large . ,(action-url :add `(large ,(+ (pagination-offset pagination) (param 'index))))))
              img)))

(defun make-images (pagination x)
  (template-list [make-image pagination _] x))

(defun past-page (x)
  (? (is_numeric x.) .x x))

(defun gallery (x)
  (let page (number (| .x. 1))
    (set-port
      (let pagination (make-pagination :page page
                                       :size *gallery-page-size*
                                       :total (get-image-count (gallery-image-selection)))
        (= *gallery-pagination* pagination)
        (= *gallery-page* (pagination-page pagination))
        (= (page-title) (| *gallery-country* (lang de "Verschiedene L&auml;nder" en "Various countries")))
        (!? (gallery-find-images :offset (pagination-offset pagination)
                                 :limit *gallery-page-size*)
            (tpl-gallery-index `((images     . ,(make-images pagination !))
                                 (pagination . ,pagination)))
            (tpl-gallery-empty))))
    (values `(,x. ,page) ..x)))

(define-action gallery)
