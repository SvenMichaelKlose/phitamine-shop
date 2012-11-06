;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-page tpl-gallery-index :path       "gallery/tpl/index.lisp")
(define-page tpl-gallery-empty :path       "gallery/tpl/empty.lisp")
(define-page tpl-gallery-image-large :path "gallery/tpl/image-large.lisp")

(define-template tpl-gallery-image :path      "gallery/tpl/image.lisp")
(define-template tpl-gallery-image-form :path "gallery/tpl/image-form.lisp")

(defvar *gallery-images* nil)
(defvar *image-index* nil)

(defun gallery-image-selection-by-user ()
  (unless (logged-in?)
    `((:f_public . "1"))))

(defun gallery-image-selection ()
  (+ (!? *gallery-country*
         `((:country . ,!)))
     (gallery-image-selection-by-user)))

(defun gallery-large (n x)
  (let old-components (copy-tree *components*)
    (keep-components n x.)
    (with (images (find-images (gallery-image-selection))
           page (required-component x.)
           pagination (make-pagination :page page
                                       :size 1
                                       :total (get-image-count (gallery-image-selection)))
           img (elt images (1- page)))
      (= *gallery-images* images)
      (set-action
          (= (page-title) (+ (assoc-value :title img) " (" (assoc-value :country img) ")"))
          (tpl-gallery-image-large
                 (+ `((:image-src  . ,(original-src img))
                      (:link-back  . ,(action-url old-components :params t))
                      (:pagination . ,pagination))
                    img)))))
  .x)

; XXX doesn't quasiquote properly in backquote with pairs in COMPILE-BACKQUOTE.
(defun make-image (pagination img)
  (prog1
    (funcall (? (logged-in?) ;(== (user-id) (assoc-value :id_user img)))
                #'tpl-gallery-image-form
                #'tpl-gallery-image)
             (+ `((:image-src        . ,(thumbnail-src img))
                  (:link-image-large . ,(action-url (+ *components* `((large ,(+ 1 (pagination-offset pagination) *image-index*)))) :params t)))
                img))
    (1+! *image-index*)))

(defun make-images (pagination x)
  (= *image-index* 0)
  (filter [make-image pagination _] x))

(defun gallery (n x)
  (| x (= x (list 1)))
  (keep-components n x.)
  (let pagination (make-pagination :page (number x.)
                                   :size *gallery-page-size*
                                   :total (get-image-count (gallery-image-selection)))
    (set-action
      (= (page-title) (| *gallery-country* (lang de "Verschiedene L&auml;nder" en "Various countries")))
      (!? (find-images (gallery-image-selection)
                       :offset (pagination-offset pagination)
                       :limit *gallery-page-size*)
          (tpl-gallery-index `((:images     . ,(make-images pagination !))
                               (:pagination . ,pagination)))
          (tpl-gallery-empty))))
  .x)

(define-action large :handler #'gallery-large)
(define-action gallery)
