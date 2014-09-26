(div :class "originalview"
  (h1 ,(param 'title)
      (img :src ,(flag-src (param 'country)))
      (br)
      ,(tpl-gallery-title-page (param 'pagination)))
  ,@(tpl-gallery-browser (param 'pagination) (param 'images))
  (a :class "back" :href ,(param 'link-back) ,(lang de "12er&#8208;&Uuml;bersicht" en "To overview"))
  ,@(& (logged-in?)
       `(,(? (== "1" (param 'f_public))
             (lang de "(&ouml;ffentlich)" en "(public)")
             (lang de "(nicht &ouml;ffentlich)" en "(not public)"))))
  (a :href ,(param 'image-src) :class "jqzoomlink" :title ,(param 'title)
    (img :class "original" :src ,(param 'image-src)))
  (p "&euro;" ,(param 'price))
  ,(tpl-gallery-buy))
