(h1 ,(lang en "Contact"
           de "Kontakt"))
(a :class "cancel" :href ,(navi-url) ,(lang en "back"
                                            de "zurück"))
(form :action "" :method "post"
  (fieldset
    (label :for "email" "E-Mail")(input :type "email"
                                        :placeholder "yourname@yourdomain.net"
                                        :value ,(form-value 'email) :name "email")
    (label :for "text" "Text")(textarea :cols "40"
                                        :rows "12"
                                        :name "text"
                                ,(form-value 'text))
    (input :type "submit"
           :value ,(lang en "Send message…"
                         de "Nachricht abschicken…"))))
