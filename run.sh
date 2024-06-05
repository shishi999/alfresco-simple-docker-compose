#!/bin/sh

# Load env file
. $1

# Check public hostname
if [ -z "${PUBLIC_HOSTNAME}" ]; then
        echo "PUBLIC_HOSTNAME is not set."
        export PUBLIC_HOSTNAME=`curl -s ifconfig.me`
	echo "$PUBLIC_HOSTNAME is set."
fi

create_volumes(){
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-acs
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-ass
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-db
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-jira
    docker volume create ${RICKSOFT_TEST_ACS_IDENTIFIER}-confluence
}

clean_volumes(){
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-acs
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-ass
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-db
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-jira
    docker volume rm ${RICKSOFT_TEST_ACS_IDENTIFIER}-confluence
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
    logs)
	docker compose --env-file $1 logs -f
	;;
    convert)
	docker compose --env-file $1 convert
	;;
    *)
    echo "./run.sh run {env file name} {up|down|clean|logs}"
esac

