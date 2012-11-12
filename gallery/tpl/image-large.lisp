(div :class "originalview"
  (h1 ,(template-param-value 'title)
      (img :src ,(flag-src (template-param-value 'country)))
      (br)
      ,(tpl-gallery-title-page))
  ,@(tpl-gallery-browser)
  (a :class "back" :href ,(template-param-value 'link-back) ,(lang de "12er&#8208;&Uuml;bersicht" en "View by the dozen"))
  ,@(& (logged-in?)
       `(,(? (== "1" (template-param-value 'f_public))
             (lang de "(&ouml;ffentlich)" en "(public)")
             (lang de "(nicht &ouml;ffentlich)" en "(not public)"))))
  (a :href ,(template-param-value 'image-src) :class "jqzoomlink" :title ,(template-param-value 'title)
    (img :class "original" :src ,(template-param-value 'image-src)))
  (p "&euro;" ,(template-param-value 'price))
  ,(tpl-gallery-buy))
