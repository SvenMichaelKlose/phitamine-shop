(html
  (head
    (meta :http-equiv "Content-Type" :content "charset=utf-8")
    (title ,(page-title))
    (link :rel "stylesheet" :type "text/css" :href ,(+ *action-base-url* "/css/reset.css"))
    (link :rel "stylesheet" :type "text/css" :href ,(+ *action-base-url* "/css/main.css"))
    (link :rel "stylesheet" :type "text/css" :href ,(+ *action-base-url* "/css/jquery.jqzoom.css"))
    (script :type "text/javascript" :src ,(+ *action-base-url* "/js/jquery-1.6.js") "")
    (script :type "text/javascript" :src ,(+ *action-base-url* "/js/jquery.jqzoom-core-pack.js") "")
    (script :type "text/javascript"
        ,(+ "$(document).ready(function(){"
                "var options={"
                "zoomType:'standard',  "
                "lens:true,"
                "preloadImages:true,"
                "alwaysOn:false,"
                "zoomWidth:480,"
                "zoomHeight:360,"
                "xOffset:0,"
                "yOffset:0,"
                "position:'right',"
                "showEffect:'fadein',"
                "hideEffect:'fadeout'"
            "};"
            "$('.jqzoomlink').jqzoom(options);"
            "});")))
  (body
    ,@(when (| (navi-status) (logged-in?))
        `((div :class "status"
            ,@(navi-status)
            ,@(when (logged-in?)
                `((p ,(lang de "Eingeloggt als Benutzer &quot;"
                            en "Logged in as user &quot;")
                    ,(user-alias)
                    "&quot;."))))))
    (div :class "header"
	  (a :href ,(action-url *home-action*) :class "logo1" "")
	  (h1 :class "stampheader" "Shop Hope Stamps")
	  (a :href ,(action-url *home-action*) :class "logo2" ""))
    (div :class "container2"
      (div :class "container1"
        (div :class "col1"
          (table
            (tr
              (td :class "navi" ,@(template-param :navi)))))
        (div :class "col2"
          ,@(template-param :content))))
    (div :class "footer")))
