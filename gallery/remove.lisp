;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-redirect-catcher (image-removed :status (lang en "The image has been removed."
                                                      de "Das Bild wurde entfernt.")))

(defun remove-image (x)
  (with (id (number .x.)
         name (assoc-value 'name (find-image `(id . ,id))))
    (alet (path-original (user-id) name)
      (& (file_exists !) (unlink !)))
    (alet (path-thumbnail (user-id) name)
      (& (file_exists !) (unlink !)))
    (delete-images (list (cons 'id id)))
    (action-redirect :remove 'remove-image :add 'image-removed)))

(define-action remove-image  :group gallery)
