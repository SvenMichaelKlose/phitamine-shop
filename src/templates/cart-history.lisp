,@(& (cart-has-undo?)
     `((a :href ,(action-url :add 'cart-undo)
         "Undo (" ,(cart-num-undos) " " ,(lang en "steps"
                                               de "Schritte") ")")))
,@(& (cart-has-redo?)
     `((a :href ,(action-url :add 'cart-redo)
         "Redo (" ,(cart-num-redos) " " ,(lang en "steps"
                                               de "Schritte") ")")))
