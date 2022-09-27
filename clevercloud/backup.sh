#! /bin/bash -l

cd "${APP_HOME}" || exit 1

export RCLONE_CONFIG_MYS3_ACCESS_KEY_ID=$CELLAR_ADDON_KEY_ID
export RCLONE_CONFIG_MYS3_SECRET_ACCESS_KEY=$CELLAR_ADDON_KEY_SECRET
export RCLONE_CONFIG_MYS3_ENDPOINT=$CELLAR_ADDON_HOST
export RCLONE_CONFIG_MYS3_TYPE="s3"
export RCLONE_CONFIG_MYS3_PROVIDER="AWS"

DOW=$(date +%u)

image_backup=./clevercloud/images-"${DOW}".tar.gz
caches_backup=./clevercloud/caches-"${DOW}".tar.gz
maps_backup=./clevercloud/maps-"${DOW}".tar.gz

tar -zcvf "${image_backup}" ./data/images
tar -zcvf "${caches_backup}" ./data/caches
tar -zcvf "${maps_backup}" ./data/maps

./clevercloud/rclone copy "${image_backup}" mys3:"${VG_BACKUP_BUCKET_NAME}" --progress --s3-acl=private --header "Content-Encoding: gzip"
./clevercloud/rclone copy "${caches_backup}" mys3:"${VG_BACKUP_BUCKET_NAME}" --progress --s3-acl=pprivate --header "Content-Encoding: gzip"
./clevercloud/rclone copy "${maps_backup}" mys3:"${VG_BACKUP_BUCKET_NAME}" --progress --s3-acl=private --header "Content-Encoding: gzip"

rm "${image_backup}"
rm "${caches_backup}"
rm "${maps_backup}"
