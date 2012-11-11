;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun update-images (x)
  (when (has-form?)
    (filter #'update-image (form-alists))
    (action-redirect 'updatedone)))

(define-action update-images :group navi)

(define-redirect-catcher (updatedone :status (lang de "Die Bilder wurden aktualisiert,"
                                                   en "The images have been updated.")))
(set-action-group 'updatedone 'navi)
