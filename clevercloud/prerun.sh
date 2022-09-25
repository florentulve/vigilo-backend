#! /bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
wget -O "$SCRIPTPATH"/rclone.zip https://github.com/rclone/rclone/releases/download/v1.59.2/rclone-v1.59.2-linux-amd64.zip
unzip "$SCRIPTPATH"/rclone.zip
mv "$SCRIPTPATH"/rclone-v1.59.2-linux-amd64/rclone "$SCRIPTPATH"/bin/rclone
rm -Rf "$SCRIPTPATH"/rclone-v1.59.2-linux-amd64
rm "$SCRIPTPATH"/rclone.zip