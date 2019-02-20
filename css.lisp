(header "Content-type: text/css; charset: UTF-8")
(princ (preg_replace "/url\\(([\"|\\']?)(.+)([\"|\\']?)\\)/"
                     (+ "url($1" *base-url* "$2$3)")
                     (file_get_contents (+ "css/" (pathlist-path (cdr (request-path-components)))))))
