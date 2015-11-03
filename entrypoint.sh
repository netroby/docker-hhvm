#!/bin/bash
set -e
if [ "${1:0:1}" = '-' ]; then
	set -- hhvm "$@"
fi

if [ "$1" = "hhvm" ]; then
	echo "Now starting hhvm"
fi

exec "$@"
