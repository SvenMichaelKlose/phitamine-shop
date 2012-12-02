;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun gallery-update-images (x)
  (when (has-form?)
    (update-images (form-alists))
    (action-redirect :remove 'gallery-update-images :add 'gallery-updated)))

(define-action gallery-update-images)

(define-redirect-catcher (gallery-updated :status (lang de "Die Bilder wurden aktualisiert,"
                                                        en "The images have been updated.")))
