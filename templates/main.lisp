,(format nil "<!doctype html>~%")
(html
  (head
    (meta :http-equiv "Content-Type" :content "charset=utf-8")
    (title ,(page-title))
    (link :rel "stylesheet" :type "text/css" :href ,(url "/css/reset.css"))
    (link :rel "stylesheet" :type "text/css" :href ,(url "/css/main.css"))
    (link :rel "stylesheet" :type "text/css" :href ,(url "/css/jquery.jqzoom.css"))
    (script :type "text/javascript" :src ,(url "/js/jquery-1.6.js") "")
    (script :type "text/javascript" :src ,(url "/js/jquery.jqzoom-core-pack.js") "")
    ,*js-jqzoom*)
  (body
    ,@(when (| (page-status) (logged-in?))
        `((div :class "status"
            ,@(page-status)
            ,@(when (logged-in?)
                `((p ,(lang de "Eingeloggt als Benutzer &quot;"
                            en "Logged in as user &quot;")
                    ,(user-alias)
                    "&quot;."))))))
    (div :class "header"
	  (a :href ,(action-url *home-components*) :class "logo1" "")
	  (h1 :class "stampheader" "Phitamine Shop")
	  (a :href ,(action-url *home-components*) :class "logo2" ""))
    (div :class "container2"
      (div :class "container1"
        (div :class "col1" (table (tr (td :class "navi" ,(port 'navi)))))
        (div :class "col2" ,(port 'content))))
    (div :class "footer")))
