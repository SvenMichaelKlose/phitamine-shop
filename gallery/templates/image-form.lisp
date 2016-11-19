(div :class "imageform"
  (input :type "hidden" :name "id[]" :value ,(param 'id))
  (a :href ,(param 'link-image-large)
    (img :src ,(param 'image-src)))
  (textarea :rows "2" :name "title[]" ,(param 'title))
  (select :name "country[]" ,@(flag-options (param 'country)))
  (input :type "text" :name "price[]" :size "8" :value ,(param 'price))
  (br)
  (input :type "checkbox" :name ,(+ "f_public[" *image-index* "]") :value "1"
         ,@(& (string== "1" (param 'f_public))
              `(:checked "checked"))
    ,(lang de "&ouml;ffentlich"
           en "public"))
  (button :onclick ,(alet (param 'title)
                      (+ "javascript: if (confirm ('"
                         (lang en (+ "Really remove this image with the title\\n&quot;" ! "&quot;?")
                               de (+ "Dieses Bild mit dem Titel\\n&quot; " ! "&quot;\\nwirklich entfernen?"))
                         "')) { window.location = '" (action-url :add (list 'remove-image (param 'id))) "'; return false; }"))
      ,(lang de "entfernen"
             en "remove")))
