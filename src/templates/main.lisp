,(format nil "<!doctype html>~%")
(html
  (head
    (meta :charset "utf-8")
    (title ,(page-title))
    (base :href ,(path-parent (%aref *_server* "SCRIPT_NAME")))
    (link :rel "stylesheet" :type "text/css" :href ,(url "/css/reset.css"))
    (link :rel "stylesheet" :type "text/css" :href ,(url "/css/main.css"))
    (link :rel "stylesheet" :type "text/css" :href ,(url "/css/jquery.jqzoom.css"))
    (script :type "text/javascript" :src ,(url "/js/jquery-1.6.js") "")
    (script :type "text/javascript" :src ,(url "/js/jquery.jqzoom-core-pack.js") "")
    ,*js-jqzoom*)
  (body
    ,@(when (| (page-status)
               (logged-in?))
        `((div :class "status"
            ,@(page-status)
            ,@(when (logged-in?)
                `((p ,(lang en "Logged in as user &quot;"
                            de "Eingeloggt als Benutzer &quot;")
                    ,(user-alias)
                    "&quot;."))))))
    (header
      (a :href ,(action-url *home-components*) :class "logo1" "")
      (h1 "Phitamine Shop")
      (a :href ,(action-url *home-components*) :class "logo2" ""))
    (div :class "container"
      (nav (table (tr (td ,(port 'navi)))))
      (main ,(port 'content)))
    (footer)))
