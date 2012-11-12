;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *gallery-images* nil)
(defvar *image-index* nil)

(defun gallery-image-selection-by-user ()
  (unless (logged-in?)
    `((f_public . "1"))))

(defun gallery-image-selection ()
  (+ (!? *gallery-country*
         `((country . ,!)))
     (gallery-image-selection-by-user)))

(defun gallery-find-images (&key (offset nil) (limit nil))
  (find-images (gallery-image-selection) :offset offset :limit limit))

(defun gallery-id-largepage (id)
  (1+ (position-if [== id (number (assoc-value 'id _))]
                   (| *gallery-images*
                      (gallery-find-images)))))
