#!/bin/bash
until mysql -hmysql-data-tier -uroot -pmysecret --ssl=0 -e "SELECT 1"; do
  echo "Waiting for MySQL..."
  sleep 2
done

echo "Injecting database list into index.html..."

# Substitute (s) the beginning of each line (^) with <p>
# Substitute (s) the end of each line ($) with <p>
# -N: tells MySQL not to print the column header (“Database”)
DB_HTML=$(mysql -h mysql-data-tier -uroot -pmysecret -N --ssl=0 -e "SHOW DATABASES;" \
  | sed 's/^/<p>/' \
  | sed 's/$/<\/p>/')

echo "<div><h2>Successfully connected to MySQL Conatiner with Databases ...</h2>${DB_HTML}</div>" > /tmp/db.html
# Remeber there is already a custom index.html via COPY in Dockerfile.
# Need to insert custom markeup which is before </body> tag.
# awk breakdown ...
# /<\/body>/	:  A pattern — it matches any line that contains the literal </body>
# {system("cat /tmp/db.html")}	:  An action block: when the pattern matches, run the shell command inside system() — here, cat /tmp/db.html, which prints that file’s contents
# {print}	:  Another action block that tells awk to print the current line (the line being processed)
awk '/<\/body>/{system("cat /tmp/db.html")}{print}' /usr/share/nginx/html/index.html > /tmp/new.html && mv /tmp/new.html /usr/share/nginx/html/index.html

#List db tables for log file
echo "List of MYSQL Databases ..."
echo "========================="
mysql -hmysql-data-tier -uroot -pmysecret --ssl=0 -e 'SHOW DATABASES;'
echo "========================="

# exec "$@" preserves all arguments exactly as they were passed.
# Run in current PID 1 which is container process
# Example : ./entrypoint.sh nginx -g "daemon off;"
# Output: nginx -g daemon off;
# then exec "$@" runs nginx -g 'daemon off;'
echo "Starting Nginx Container ..."
exec "$@"
