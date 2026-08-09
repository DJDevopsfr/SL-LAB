# 1. Inspect the docker compose yml file and ensure understanding

# 2. Bring up all docker compose services
docker compose up -d

# 3. Log into "web" service and install ping to test comnnectiviity to mysql and connect via mysql client to show db tables.
docker compose exec web bash

- apt update && apt install -y iputils-ping
- ping mysql-data-tier

# Now also install mysql client to test connectivity to db
- apt-get install -y default-mysql-client
- mysql -h mysql-data-tier -uroot -pmysecret --ssl=0 -e "SHOW DATABASES;"


# Tear sll docker compose services down
#-v removes the named volume.
docker compose down -v

# Expirement with all these docker compose commands ...

#| Command                      | Description                            |
#| ---------------------------- | -------------------------------------- |
#|  docker compose up           | Create and start containers            |
#|  docker compose up -d        | Start in detached mode                 |
#|  docker compose down         | Stop and remove containers, network    |
#|  docker compose ps           | Show running services                  |
#|  docker compose logs         | Show logs from all services            |
#|  docker compose logs web
#|  docker compose logd db 
#|  docker compose exec web sh  | Run a shell inside a service container |


#depends_on:: controls container start order, not readiness.
#Need to implement a healthcheck for readiness in compose file.
