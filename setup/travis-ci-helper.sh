#!/bin/bash -c

if [ "$DIALECT" = "postgres" ]; then
    npm i pg@^7 pg-hstore@^2 pg-types@^2;
elif [ "$DIALECT" = "mysql" ]; then
    npm i mysql2@^1;
elif [ "$DIALECT" = "mariadb" ]; then
    npm i mariadb@^2;
elif [ "$DIALECT" = "sqlite" ]; then
    npm i sqlite3@^4;
fi

if [ $MARIADB_VER ]; then
    export MARIADB_ENTRYPOINT=$TRAVIS_BUILD_DIR/setup/mariadb;
elif [ $POSTGRES_VER ] || [ $MARIADB_VER ] || [ $MYSQL_VER ]; then
    docker-compose up -d ${POSTGRES_VER} ${MARIADB_VER} ${MYSQL_VER};
elif [ $MARIADB_VER ]; then
    docker run --link ${MARIADB_VER}:db -e CHECK_PORT=3306 -e CHECK_HOST=db --net sequelizesscce_default giorgos/takis;
elif [ $MYSQL_VER ]; then
    docker run --link ${MYSQL_VER}:db -e CHECK_PORT=3306 -e CHECK_HOST=db --net sequelizesscce_default giorgos/takis;
elif [ $POSTGRES_VER ]; then
    docker run --link ${POSTGRES_VER}:db -e CHECK_PORT=5432 -e CHECK_HOST=db --net sequelizesscce_default giorgos/takis;
fi

if [ $USE_TS ]; then
    npm run ts-prep;
fi
