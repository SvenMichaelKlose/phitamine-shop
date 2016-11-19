; Copyright (c) 2012–2014,2016 Sven Michael Klose <pixel@copei.de>

(defvar *gallery-page-size* 12)

(define-template tpl-gallery-index       :path "gallery/templates/index.lisp")
(define-template tpl-gallery-image       :path "gallery/templates/image.lisp")
(define-template tpl-gallery-image-form  :path "gallery/templates/image-form.lisp")

(defun make-image (pagination img)
  (funcall (? (logged-in?) ;(== (user-id) (@ img 'id_user)))
              #'tpl-gallery-image-form
              #'tpl-gallery-image)
           (+ (list (. 'image-src        (thumbnail-src img))
                    (. 'link-image-large (action-url :add `(large ,(+ (pagination-offset pagination) (param 'index))))))
              img)))

(defun lml-images (pagination x)
  (template-list [make-image pagination _] x))

(defun gallery-pagination (page)
  (make-pagination :page  page
                   :size  *gallery-page-size*
                   :total (get-image-count (gallery-image-selection))))

(defun paginated-images (pagination)
  (gallery-find-images :limit *gallery-page-size*
                       :offset (pagination-offset pagination)))

(defun gallery (x)
  (with (page        (number (| .x. 1))
         pagination  (gallery-pagination page)
         images      (paginated-images pagination))
    (= (page-title) (+ (| *gallery-country*
                          (+ (lang de "Verschiedene L&auml;nder"
                                   en "Various countries")))
                       " &#8208; "
                       (pagination-title pagination)))
    (set-port
      (tpl-gallery-index (list (. 'pagination pagination)
                               (. 'images     images)
                               (. 'lml-images (lml-images pagination images)))))
    (values `(,x. ,page) ..x)))

(define-action gallery)
