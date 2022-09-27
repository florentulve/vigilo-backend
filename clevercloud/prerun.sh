#! /bin/bash

cd "${APP_HOME}" || exit 1


mkdir -p ./data/{images,caches,maps}

if [ -f "./clevercloud/rclone" ]; then
    exit;
fi

wget -q -O ./clevercloud/rclone.zip https://github.com/rclone/rclone/releases/download/v1.59.2/rclone-v1.59.2-linux-amd64.zip
unzip ./clevercloud/rclone.zip -d ./clevercloud
mv ./clevercloud/rclone-v1.59.2-linux-amd64/rclone ./clevercloud/rclone
rm -Rf ./clevercloud/rclone-v1.59.2-linux-amd64
rm ./clevercloud/rclone.zip


