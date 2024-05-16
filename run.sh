#!/bin/sh

# Load env file
. $1

create_volumes(){
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-acs
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-ass
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-db
}

clean_volumes(){
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-acs
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-ass
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-db
}

case "$2" in
    up)
        create_volumes
        docker compose --env-file $1 up -d
        docker compose --env-file $1 logs -f
        ;;
    down)
        docker compose --env-file $1 down
        ;;
    clean)
        clean_volumes
        ;;
    *)
    echo "./run.sh run {env file name} {up|down|clean}"
esac

