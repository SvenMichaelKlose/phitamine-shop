(h1 ,(lang de "Kontakt"
           en "Contact"))
(a :class "cancel" :href ,(navi-url) ,(lang de "zur&uuml;ck" en "back"))
(form :action "" :method "post"
  (fieldset
    (label :for "email" "E-Mail")(input :type "text" :value ,(form-string 'email) :name "email")
    (label :for "text" "Text")(textarea :cols "40" :rows "12" :name "text" ,(form-string 'text))
    (input :type "submit" :value ,(lang de "Nachricht abschicken..."
                                        en "Send message..."))))
