#!/usr/bin/env bash

case "${0##*/}" in
	pywrap.sh) arg1="";;
	*) arg1="$0.py" ;;
esac

for bin in python python3 python2 python3.7 python3.6 python3.5 python2.7 python2.6 python2.5; do
    case "$($bin -V 2>&1)" in
        "Python 2"*) exec $bin $arg1 "$@" ;;
    esac
    case "$($bin -V 2>&1)" in
        "Python 3"*) exec $bin $arg1 "$@" ;;
    esac
done

echo "Unable to find a Python interpreter for executing ${arg1:+$arg1 }$@ !" >&2
exit 1
