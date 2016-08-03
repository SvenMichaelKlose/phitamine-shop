#!/bin/sh

rm -rf compiled
mkdir compiled
time tre makefiles/make.lisp && cp -rv css js media compiled && cp -v config.php compiled/config.php.example
