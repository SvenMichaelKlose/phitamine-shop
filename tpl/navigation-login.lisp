(h1 "Login")
(a :class "cancel" :href ,(navi-reset-url) ,(lang de "zur&uuml;ck" en "back"))
(form :method "post" :action ""
  (label :for "alias" "Benutzername")(input :type "text" :name "alias" :value ,(| (assoc-value :alias (form-data) "")))
  (label :for "password" "Passwort")(input :type "password" :name "password" :value ,(| (assoc-value :password (form-data) "")))
  (input :type "submit" :value "Login..."))
