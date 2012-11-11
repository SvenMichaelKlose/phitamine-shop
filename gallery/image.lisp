;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(dont-obfuscate strtotime)

(defun image-src (img section)
  (action-url (list section (assoc-value 'id img) (assoc-value 'name img))))

(defun thumbnail-src (img) (image-src img 'thumbnail))
(defun original-src (img)  (image-src img 'original))

(defun generate-gallery-image (path-maker x)
  (alet (find-image (list (cons 'id (number .x.))))
    (send-header :mime-type (assoc-value 'type !)
                 :mod-time (strtotime (assoc-value 't_create !))
                 :max-age 3600)
    (file_get_contents (funcall path-maker (assoc-value 'id_user !)
                                           (assoc-value 'name !))))
  (quit))

(defun thumbnail (x) (generate-gallery-image #'path-thumbnail x))
(defun original (x)  (generate-gallery-image #'path-original  x))

(define-action thumbnail)
(define-action original)
