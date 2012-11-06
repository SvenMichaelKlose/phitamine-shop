;;;;; tré – Copyright (c) 2008–2012 Sven Michael Klose <pixel@copei.de>

(make-project "Stampdream"
              :target 'php
              :obfuscate? nil
              :files '("test.lisp")
              :emitter [with-open-file out (open "compiled/test.php" :direction 'output)
                         (princ _ out)])
(quit)
