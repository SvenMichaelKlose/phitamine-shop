(var *image-index* nil)

(fn gallery-image-selection-by-user ()
  (unless (logged-in?)
    (list (. 'f_public "1"))))

(fn gallery-image-selection ()
  (+ (!? *gallery-country*
         (list (. 'country !)))
     (gallery-image-selection-by-user)))

(fn gallery-find-images (&key (offset nil) (limit nil))
  (find-images (gallery-image-selection) :offset offset :limit limit))

(fn gallery-id-largepage (id)
  (++ (position-if [== id (number (assoc-value 'id _))]
                   (gallery-find-images))))
