#! /bin/bash

cd "${APP_HOME}" || exit 1

./clevercloud/rclone --config=./clevercloud/rclone.conf copy ./data/images gdrive:/vigilo-backup/images
