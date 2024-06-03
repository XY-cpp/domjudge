#!/bin/bash
if [ -e "database" ]; then
  echo "Please remove old database before running this script."
  exit
fi

docker compose up -d dj-mariadb domserver
echo "Waiting for domserver to become healthy..."
while [[ "$(docker inspect -f '{{.State.Health.Status}}' domserver)" != "healthy" ]]; do
  sleep 1
done

password=$(docker exec -it domserver cat /opt/domjudge/domserver/etc/restapi.secret | grep "default" | awk '{print $4}' | tr -d '\r')
echo "JUDGEDAEMON_PASSWORD=$password" > judgehost.secret
docker compose up -d judgehost

password=$(docker exec -it domserver cat /opt/domjudge/domserver/etc/initial_admin_password.secret)
echo "$password" > admin_pass
echo "Password for admin is: $password"
echo "Website address is: http://localhost:8001"

