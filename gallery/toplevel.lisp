;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-template tpl-gallery-index       :path "gallery/tpl/index.lisp")
(define-template tpl-gallery-empty       :path "gallery/tpl/empty.lisp")
(define-template tpl-gallery-image       :path "gallery/tpl/image.lisp")
(define-template tpl-gallery-image-large :path "gallery/tpl/image-large.lisp")
(define-template tpl-gallery-image-form  :path "gallery/tpl/image-form.lisp")

(defvar *gallery-images* nil)
(defvar *gallery-page* nil)
(defvar *gallery-pagination* nil)
(defvar *image-index* nil)

(defun gallery-image-selection-by-user ()
  (unless (logged-in?)
    `((f_public . "1"))))

(defun gallery-image-selection ()
  (+ (!? *gallery-country*
         (list (cons 'country ,!)))
     (gallery-image-selection-by-user)))

(defun gallery-large (x)
  (let old-components (copy-tree *components*)
    (set-port
      (with (images (find-images (gallery-image-selection))
             page (number .x.)
             pagination (make-pagination :page page
                                         :size 1
                                         :total (get-image-count (gallery-image-selection)))
             img (elt images (1- page)))
        (= *gallery-pagination* pagination)
        (= *gallery-page* (pagination-page pagination))
        (= *gallery-images* images)
        (= (page-title) (+ (assoc-value 'title img) " (" (assoc-value 'country img) ")"))
        (tpl-gallery-image-large (+ (list (cons 'image-src  (original-src img))
                                          (cons 'link-back  (action-url old-components))
                                          (cons 'pagination pagination))
                                    img)))))
  2)

; XXX doesn't quasiquote properly in backquote with pairs in COMPILE-BACKQUOTE.
(defun make-image (pagination img)
  (prog1
    (funcall (? (logged-in?) ;(== (user-id) (assoc-value 'id_user img)))
                #'tpl-gallery-image-form
                #'tpl-gallery-image)
             (+ (list (cons 'image-src (thumbnail-src img))
                      (cons 'link-image-large (action-url :add (list 'large (+ 1 (pagination-offset pagination) *image-index*)))))
                img))
    (1+! *image-index*)))

(defun make-images (pagination x)
  (= *image-index* 0)
  (filter [make-image pagination _] x))

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
        (!? (find-images (gallery-image-selection)
                         :offset (pagination-offset pagination)
                         :limit *gallery-page-size*)
            (tpl-gallery-index (list (cons 'images  (make-images pagination !))
                                     (cons 'pagination pagination)))
            (tpl-gallery-empty))))
    (values (list x. page) ..x)))

(define-action large :handler #'gallery-large)
(define-action gallery)
