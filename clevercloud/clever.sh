#! /bin/bash
#set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

app_name="vigilo"
org_name="skylett"
php_plan_min="nano"
php_plan_max="XS"
#mysql_plan="xxs_med"
mysql_plan="xxs_sml"

domain="vigilo.ulve-bzh.fr"

echo -e "Unlincking and deleting old app..."
clever unlink ${app_name}
clever delete ${app_name}
clever addon delete vigilo-cellar
clever addon delete vigilo-db
clever addon delete vigilo-fs

echo -e "Creating app and addons..."
clever create --type php ${app_name}
clever scale --min-instances 1 --max-instances 1 --min-flavor "${php_plan_min}" --max-flavor "${php_plan_max}"
clever config set force-https true
clever config set cancel-on-push true
clever config set zero-downtime false

#Addons
clever addon create cellar-addon --plan "S" vigilo-cellar --link ${app_name}
clever addon create mysql-addon --plan "${mysql_plan}"  vigilo-db --link ${app_name}
clever addon create fs-bucket  --plan "s" vigilo-fs  --link ${app_name}

# shellcheck source=/dev/null
. <(clever env --add-export)

echo -e "Configuring app..."
clever env set CC_FS_BUCKET "/app/data/:${BUCKET_HOST}"
clever env set CC_PRE_RUN_HOOK "./clevercloud/prerun.sh"
clever env set CC_WEBROOT "/app"
clever domain add "${domain}"

# Bucket for backups
bucket_name="${org_name}-${app_name}-backup"
clever env set VG_BACKUP_BUCKET_NAME "${bucket_name}"
s3cmd -v --access_key=${CELLAR_ADDON_KEY_ID} --secret_key=${CELLAR_ADDON_KEY_SECRET} --default-mime-type="binary/octet-stream" --host="${CELLAR_ADDON_HOST}" --host-bucket="%(bucket)s.${CELLAR_ADDON_HOST}" mb s3://"${bucket_name}"

echo -e "Init database (this can take time)..."

# cat "${SCRIPT_DIR}"/../mysql/pre_sql.sql "${SCRIPT_DIR}"/../mysql/init/*.sql > all.sql
ls -v "${SCRIPT_DIR}"/../mysql/init/*.sql | xargs cat > all.sql
# make comment valid by adding a space after two dash - https://stackoverflow.com/questions/38074662/mysql-error-1064-you-have-an-error-in-your-sql-syntax-triggered-by-sql-comme
sed -i -e 's/^\-\-/\-\- /g' ./all.sql
# Strip bad default instruction in 0.0.2.sql
badline=$(grep -n -E 'obs_explanation(.*)DEFAULT' all.sql | cut -d: -f1)
sed -i "${badline}s/ DEFAULT '',/,/" ./all.sql

n=0
until [ "$n" -ge 10 ]
do
   podman run -i --rm docker.io/mysql:latest mysql -h "${MYSQL_ADDON_HOST}" --database "${MYSQL_ADDON_DB}" -P "${MYSQL_ADDON_PORT}" -u "${MYSQL_ADDON_USER}" -p"${MYSQL_ADDON_PASSWORD}" < all.sql && break
   n=$((n+1))
   sleep 30
done

#clever deploy