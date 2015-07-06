#!/bin/bash
set -e

for i in "$@"
do
case $i in
    --migrate)
    MIGRATE="true"
    ;;
    --collectstatic)
    COLLECTSTATIC="true"
    ;;
    --supervisord)
    SUPERVISORD="true"
    ;;
    *)# unknown option
    ;;
esac
done

MANAGE_PY="/opt/sso-venv/bin/python /opt/sso/manage.py"

if [ -n $MIGRATE ]; then
    $MANAGE_PY migrate --noinput
fi

if [ -n $COLLECTSTATIC ]; then
    $MANAGE_PY collectstatic --noinput
fi

if [ -n $SUPERVISORD ]; then
    exec "supervisord"
fi

exec /bin/bash
