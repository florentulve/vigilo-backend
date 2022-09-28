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

#./clevercloud/rclone sync ./app/images mys3:"${VG_BACKUP_BUCKET_NAME}"/images --progress --s3-acl=private --header "Content-Encoding: gzip"
#./clevercloud/rclone sync ./app/caches mys3:"${VG_BACKUP_BUCKET_NAME}"/caches --progress --s3-acl=private --header "Content-Encoding: gzip"
#./clevercloud/rclone sync ./app/maps mys3:"${VG_BACKUP_BUCKET_NAME}"/maps --progress --s3-acl=private --header "Content-Encoding: gzip"

tar -zcvf "${image_backup}" -C ./app ./images
tar -zcvf "${caches_backup}" -C ./app ./caches
tar -zcvf "${maps_backup}" -C ./app/ ./maps

./clevercloud/rclone sync "${image_backup}" mys3:"${VG_BACKUP_BUCKET_NAME}"/archives --progress --s3-acl=private --header "Content-Encoding: gzip"
./clevercloud/rclone sync "${caches_backup}" mys3:"${VG_BACKUP_BUCKET_NAME}"/archives --progress --s3-acl=private --header "Content-Encoding: gzip"
./clevercloud/rclone copy "${maps_backup}" mys3:"${VG_BACKUP_BUCKET_NAME}"/archives --progress --s3-acl=private --header "Content-Encoding: gzip"

rm "${image_backup}"
rm "${caches_backup}"
rm "${maps_backup}"
