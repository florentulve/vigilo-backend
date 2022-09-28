#! /bin/bash

# shellcheck source=/dev/null
. <(clever env --add-export)
s3cmd -v --access_key="${CELLAR_ADDON_KEY_ID}" --secret_key="${CELLAR_ADDON_KEY_SECRET}" --default-mime-type="binary/octet-stream" --host="${CELLAR_ADDON_HOST}" --host-bucket="%(bucket)s.${CELLAR_ADDON_HOST}" sync s3://skylett-vigilo-backup ./s3-data