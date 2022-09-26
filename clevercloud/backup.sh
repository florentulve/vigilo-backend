#! /bin/bash

cd "${APP_HOME}" || exit 1

export RCLONE_CONFIG_MYS3_ACCESS_KEY_ID=$CELLAR_ADDON_KEY_ID
export RCLONE_CONFIG_MYS3_SECRET_ACCESS_KEY=$CELLAR_ADDON_KEY_SECRET
export RCLONE_CONFIG_MYS3_ENDPOINT=$CELLAR_ADDON_HOST
export RCLONE_CONFIG_MYS3_TYPE="s3"

./clevercloud/rclone sync ./data/images mys3:images.vigilo.lorient.dev --progress --s3-acl=public-read --header "Content-Encoding: gzip"
