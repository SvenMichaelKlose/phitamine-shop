;;;;; Copyright (c) 2012,2014 Sven Michael Klose <pixel@copei.de>

(define-redirect-catcher (image-removed :status (lang en "The image has been removed."
                                                      de "Das Bild wurde entfernt.")))

(defun unlink-if-exists (pathname)
  (& (file_exists pathname)
     (unlink pathname)))

(defun remove-image (x)
  (with (id    (number .x.)
         name  (assoc-value 'name (find-image `(id . ,id))))
    (unlink-if-exists (path-original (user-id) name))
    (unlink-if-exists (path-thumbnail (user-id) name))
    (delete-images (list (cons 'id id)))
    (action-redirect :remove 'remove-image :add 'image-removed)))

(define-action remove-image  :group gallery)
