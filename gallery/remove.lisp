(define-redirect-catcher (image-removed :status (lang en "The image has been removed."
                                                      de "Das Bild wurde entfernt.")))

(fn unlink-if-exists (pathname)
  (& (file_exists pathname)
     (unlink pathname)))

(fn remove-image (x)
  (with (id    (number .x.)
         name  (assoc-value 'name (find-image (. 'id id))))
    (unlink-if-exists (path-original (user-id) name))
    (unlink-if-exists (path-thumbnail (user-id) name))
    (delete-images (list (. 'id id)))
    (action-redirect :remove 'remove-image :add 'image-removed)))

(define-action remove-image  :group gallery)
