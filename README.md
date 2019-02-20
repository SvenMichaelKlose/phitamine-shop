#!/bin/less

# Overview

This is a web shop for precious stamps created with phitamine and
centralservices.  It pitches phitamine's nifty URL schema for
multiple ports, a cart with undo and a CSS upload form for your
favourite design artists.

You need the tré programming language on some Unix with 'git' and
'docker-compose' installed.

http://github.com/SvenMichaelKlose/tre


# Running it

Run 'install-modules.sh' to clone all required modules into
directory 'tre_modules'.

Run 'make.sh' and you'll find a huge index.php in a newly create
directory called 'compiled'.

Step into 'compiled' and run 'sudo docker-compose up'. When that's
up, install the database by running:

```sh
mysql -u root -p -h 0.0.0.0 fnord <init.sql
```

The password is 'fnord'.  Now you can browse the empty shop at
address http://localhost:19020.

## Logging into the admin area of the shop

The username and password for the admin area is both 'pixel'.

## Running the shop in subdirectories.

Phitamine Shop will also run in subdirectories of a web server
but you'll have to modify file '.htaccess'.  If you want to move
the thing to directory '/demoshop', for example, you have to turn
the line

```
RewriteRule .? /index.php$1 [L]
```

into

```
RewriteRule .? /demoshop/index.php$1 [L]
```


# Problems

The CSS is out of date and needs to be redone, preferably
with Flexbox.
