echo "Creating tmp folder"
mkdir -p tmp

echo "Backup target DB data"
docker exec -i blog-db mysqldump -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > ./tmp/backup_target_db.sql

echo "Executing mysqldump -h ${OLD_DB_IP} -u ${OLD_MYSQL_USER} -p*** ${MYSQL_DATABASE} > ./tmp/source_db.sql"
mysqldump -h ${OLD_DB_IP} -u${OLD_MYSQL_USER} -p${OLD_MYSQL_PASSWORD} ${MYSQL_DATABASE} > ./tmp/source_db.sql

echo "Backup and dump finished. Files are:"
ls -lrth --color tmp

echo "Executing docker exec -i blog-db mysql -u ${MYSQL_USER} -p *** ${MYSQL_DATABASE} < ./tmp/source_db.sql"
docker exec -i blog-db mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ./tmp/source_db.sql

echo "Migrating data from ${FROM_HOST} to ${TO_HOST}"
envsubst < ./update-host.sql | docker exec -i blog-db mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}

echo "DB migration finished. Deleting ./tmp/source_db.sql"
rm ./tmp/source_db.sql

echo "Copy load file into docker..."
echo "docker cp ${LOCAL_UPLOAD} blog-wordpress:/var/www/html/wp-content"
docker cp ${LOCAL_UPLOAD} blog-wordpress:/var/www/html/wp-content
