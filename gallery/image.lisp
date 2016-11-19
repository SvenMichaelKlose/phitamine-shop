; Copyright (c) 2012,2014,2016 Sven Michael Klose <pixel@copei.de>

(defun image-src (img section)
  (action-url `(,section ,(assoc-value 'id img) ,(assoc-value 'name img))))

(defun thumbnail-src (img) (image-src img 'thumbnail))
(defun original-src (img)  (image-src img 'original))

(defun generate-gallery-image (path-maker x)
  (alet (find-image (. 'id (number .x.)))
    (send-header :mime-type (assoc-value 'type !)
                 :mod-time  (strtotime (assoc-value 't_create !))
                 :max-age   0)
    (princ (file_get_contents (funcall path-maker (assoc-value 'id_user !)
                                                  (assoc-value 'name !)))))
  (quit))

(defun thumbnail (x) (generate-gallery-image #'path-thumbnail x))
(defun original (x)  (generate-gallery-image #'path-original  x))

(define-action thumbnail)
(define-action original)
