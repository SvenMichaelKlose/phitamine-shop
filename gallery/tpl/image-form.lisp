(div :class "imageform"
  (input :type "hidden" :name "id[]" :value ,@(template-param 'id))
  (a :href ,@(template-param 'link-image-large)
    (img :src ,@(template-param 'image-src)))
  (textarea :rows "2" :name "title[]" ,@(template-param 'title))
  (select :name "country[]" ,@(flag-options (template-param-value 'country)))
  (input :type "text" :name "price[]" :size "8" :value ,(template-param-value 'price))
  (br)
  (input :type "hidden" :name ,(+ "f_public[" *image-index* "]") :value "0")
  (input :type "checkbox" :name ,(+ "f_public[" *image-index* "]") :value "1"
         ,@(& (string== "1" (template-param-value 'f_public))
              `(:checked "checked"))
    ,(lang de "&ouml;ffentlich"
           en "public"))
  (button :onclick ,(alet (template-param-value 'title)
                      (+ "javascript: if (confirm ('"
                         (lang en (+ "Really remove this image with the title\\n&quot;" ! "&quot;?")
                               de (+ "Dieses Bild mit dem Titel\\n&quot; " ! "&quot;\\nwirklich entfernen?"))
                         "')) { window.location = '" (action-url :add (list 'remove-image (template-param-value 'id))) "'; return false; }"))
      ,(lang de "entfernen"
             en "remove")))
