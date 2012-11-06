#!/bin/sh

echo $1
find . -name \*.lisp | xargs grep $1
