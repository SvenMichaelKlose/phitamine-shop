(fn wg-css-upload ()
  (when (| ,*have-css-upload?* nil) ; TODO: Optimizer bug in tré.
    `((form :action ,(action-url :add 'css-upload)
            :method "post"
            :enctype "multipart/form-data"
            :class "css_upload"
        (input :type "file" :name "css[]")(br)
        (input :type "submit" :value "Upload CSS…")))))
