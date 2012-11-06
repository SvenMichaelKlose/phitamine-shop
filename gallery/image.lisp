;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun image-src (img section)
  (action-url (list section (assoc-value :id img) (assoc-value :name img))))

(defun thumbnail-src (img)
  (image-src img 'thumbnail))

(defun original-src (img)
  (image-src img 'original))

(dont-obfuscate strtotime)

(defun submit-image (path-maker id)
  (= *action*
     #'(()
         (alet (find-image (list (cons :id id)))
           (send-header :mime-type (assoc-value :type !)
                        :mod-time (strtotime (assoc-value :t_create !))
                        :max-age 3600)
           (file_get_contents (funcall path-maker (assoc-value :id_user !)
                                                  (assoc-value :name !)))))))

(defun thumbnail (n x)
  (submit-image #'path-thumbnail x.)
  .x)

(defun original (n x)
  (submit-image #'path-original x.)
  .x)

; XXX Doesn't compile anonymous functions here.
(define-action thumbnail)
(define-action original)
