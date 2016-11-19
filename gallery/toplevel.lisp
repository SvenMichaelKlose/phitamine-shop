; Copyright (c) 2012–2014,2016 Sven Michael Klose <pixel@copei.de>

(defvar *image-index* nil)

(defun gallery-image-selection-by-user ()
  (unless (logged-in?)
    (list (. 'f_public "1"))))

(defun gallery-image-selection ()
  (+ (!? *gallery-country*
         (list (. 'country !)))
     (gallery-image-selection-by-user)))

(defun gallery-find-images (&key (offset nil) (limit nil))
  (find-images (gallery-image-selection) :offset offset :limit limit))

(defun gallery-id-largepage (id)
  (++ (position-if [== id (number (assoc-value 'id _))]
                   (gallery-find-images))))
