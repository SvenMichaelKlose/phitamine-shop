#!/bin/sh

mkdir compiled
time tre makefiles/make.lisp && \
    cp -rv assets/* compiled && \
    mv -v compiled/htaccess compiled/.htaccess
mkdir -p compiled/gallery-images
chmod -R 777 compiled/gallery-images
