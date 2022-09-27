#! /bin/bash
set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

app_name="vigilo"
org_name="skylett"
php_plan_min="nano"
php_plan_max="XS"
#mysql_plan="XXS Medium Space"
mysql_plan="dev"

domain="vigilo.ulve-bzh.fr"

clever create --type php ${app_name}
clever scale --min-instances 1 --max-instances 1 --min-flavor "${php_plan_min}" --max-flavor "${php_plan_max}"
clever config set force-https true
clever config set cancel-on-push true

#Addons
clever addon create cellar-addon --plan "S" vigilo-cellar --link ${app_name}
clever addon create mysql-addon --plan "${mysql_plan}"  vigilo-db --link ${app_name}
clever addon create fs-bucket  --plan "s" vigilo-fs  --link ${app_name}

# shellcheck source=/dev/null
. <(clever env --add-export)

clever env set CC_FS_BUCKET "/data/:${BUCKET_HOST}"
clever env set CC_PRE_RUN_HOOK "./clevercloud/prerun.sh"
clever env set CC_WEBROOT "/app"

clever domain add "${domain}"

# Bucket for backups
bucket_name="${org_name}-${app_name}-backup"
clever env set VG_BACKUP_BUCKET_NAME "${bucket_name}"
# TODO: Automate bucket creation
#s3cmd mb s3://

cat "${SCRIPT_DIR}"/../mysql/pre_sql.sql "${SCRIPT_DIR}"/../mysql/init/*.sql > all.sql
mysql -h "${MYSQL_ADDON_HOST}" -P 3306 -u "${MYSQL_ADDON_USER}" -p "${MYSQL_ADDON_PORT}" < all.sql
