#! /bin/bash

cd "${APP_HOME}" || exit 1

# fs bucket init

mkdir -p ./app/data/{images,caches,maps}
cp ./app/images/* ./app/data/images
cp ./app/caches/* ./app/data/caches
cp ./app/maps/* ./app/data/maps

# rclone init

if [ -f "./clevercloud/rclone" ]; then
    exit;
fi


wget -q -O ./clevercloud/rclone.zip https://github.com/rclone/rclone/releases/download/v1.59.2/rclone-v1.59.2-linux-amd64.zip
unzip ./clevercloud/rclone.zip -d ./clevercloud
mv ./clevercloud/rclone-v1.59.2-linux-amd64/rclone ./clevercloud/rclone
rm -Rf ./clevercloud/rclone-v1.59.2-linux-amd64
rm ./clevercloud/rclone.zip


