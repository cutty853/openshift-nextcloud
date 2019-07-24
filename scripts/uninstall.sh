#!/bin/bash

usage() {
    echo "usage:"
    echo "./uninstall.sh all # will uninstall absolutely all the datas (including pvc and dependencies)"
    echo "./uninstall.sh pvc # will uninstall only the pvc and application (not dependencies)"
    echo "./uninstall.sh app # will uninstall only the application (not the pvc and not dependencies)"
    echo "./uninstall.sh project # will uninstall only the application and dependencies (not the pvc)"
}

if [ "$1" == "" ]; then
    usage
    exit 1
fi

uninstall_app () {
    oc delete all,secret -l app=nextcloud
}

uninstall_pvc () {
    oc delete pvc -l app=nextcloud
}

uninstall_dependencies () {
    oc delete is rebuild-nextcloud
    oc delete template nextcloud
}

# this logic is deliberately dump
if [ "$1" == "all" ]; then
    uninstall_app
    uninstall_dependencies
    uninstall_pvc
elif [ "$1" == "app" ]; then
    uninstall_app
elif [ "$1" == "pvc" ]; then
    uninstall_app
    uninstall_pvc
elif [ "$1" == "project" ]; then
    uninstall_app
    uninstall_dependencies
else
    printf "unknow command: %s\n" $1
    usage
    exit 1
fi

exit 0