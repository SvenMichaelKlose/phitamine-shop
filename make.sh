#!/bin/sh

mkdir compiled
time tre makefiles/shop.lisp && \
    cp -rv assets/* compiled
tre makefiles/css.lisp
mkdir -p compiled/gallery-images
chmod -R 777 compiled/gallery-images
