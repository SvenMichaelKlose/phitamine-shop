(h1 "Login")
(a :class "cancel" :href ,(navi-url) ,(lang de "zur&uuml;ck" en "back"))
(form :method "post" :action ""
  (label :for "alias" "Benutzername")(input :type "text" :name "alias" :value ,(form-value 'alias))
  (label :for "password" "Passwort")(input :type "password" :name "password" :value ,(form-value 'password))
  (input :type "submit" :value "Login..."))
