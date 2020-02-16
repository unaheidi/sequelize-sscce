#!/bin/bash
if [ "$DIALECT" = "postgres" ]; then
    npm i pg@^7 pg-hstore@^2 pg-types@^2;
elif [ "$DIALECT" = "mysql" ]; then
    npm i mysql2@^1;
elif [ "$DIALECT" = "mariadb" ]; then
    npm i mariadb@^2;
elif [ "$DIALECT" = "sqlite" ]; then
    npm i sqlite3@^4;
fi
