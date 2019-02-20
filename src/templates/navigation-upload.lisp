(form :action ,(action-url :remove 'upload-images :add 'upload-images) :method "post" :enctype "multipart/form-data"
  (h1 "Upload")
  (a :class "cancel" :href ,(navi-url) ,(lang en "back"
                                              de "zurück"))
  ,@(maptimes [`(input :type "file" :name "image[]" :size "10")] 10)
  (input :type "submit" :value "Upload…"))
