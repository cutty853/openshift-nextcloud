#!/bin/bash

# Acess nextcloud homepage before using this script !

# Use this scripts to change the nextcloud configuration in the pod. For the
# moment this script just add the following parameters to the configuration
# - check_data_directory_permissions = false

APP_NAME=nextcloud
NEXTCLOUD_POD_NAME=$(oc get pods -l app=$APP_NAME | grep -v -E  "(db)|(NAME)" | cut -d " " -f 1)

oc rsync $NEXTCLOUD_POD_NAME:/var/www/html/config /tmp/
sed 's/);/  "check_data_directory_permissions" => false,\n);/g' -i /tmp/config/config.php
oc rsync /tmp/config $NEXTCLOUD_POD_NAME:/var/www/html

rm -r /tmp/config