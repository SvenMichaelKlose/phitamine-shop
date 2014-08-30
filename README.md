#!/bin/less

# Overview

This is an example web shop for precious stamps created with
phitamine and centralservices.  It pitches a nifty URL schema
for multiple ports, a cart with undo and a CSS upload form
for your favourite design artists.

# Installing

You need the environment directory of tré linked here as
well as centralservices and phitamine. Like so:

    ln -s ../tre/environment .
    ln -s ../phitamine .
    ln -s ../centralservices .

# Compiling

First of all, tweak the configuration files and 'htaccess'.
Rename 'htaccess' to '.htaccess'.  Then run

    make.sh

and you'll find a huge index.php in a newly create directory
called 'compiled'.  Upload that file as well as 'config.php',
'.htaccess' and the directories 'css' and 'media' to your web
server.
