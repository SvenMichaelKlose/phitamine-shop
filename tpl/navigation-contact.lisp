(h1 ,(lang de "Kontakt"
           en "Contact"))
(a :class "cancel" :href ,(navi-reset-url) ,(lang de "zur&uuml;ck" en "back"))
(form :action ,(action-url t :params (list (cons :action "contact")))
      :method "post"
  (fieldset
    (input :type "hidden" :value "contact" :name "action")
    (label :for "email" "E-Mail")(input :type "text" :value ,(| (assoc-value :email (form-data)) "") :name "email")
    (label :for "text" "Text")(textarea :cols "40" :rows "12" :name "text" ,(| (assoc-value :text (form-data)) ""))
    (input :type "submit" :value ,(lang de "Nachricht abschicken..."
                                        en "Send message..."))))
