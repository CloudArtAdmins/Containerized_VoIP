#!/bin/sh

# Note: if you are using Docker, please see the docker version of this script. (May not be made yet)

VOIP_DB="voip-db"
PORT=3000
BASE_URL=localhost
COOKIE_KEY=4c5h3sve45yte55rgae984hvs4780gtsRH5ygrs54r5Hr4adRSjgg66y8634
APP_VERSION="v0.66-beta"
SIGNUPS=on
NODE_OPTIONS="--max_old_space_size=460"

podman pod create --name voip
# For simplicity of keeping the repo update, the "latest" image will be set by default untill otherwise is necessary. 
podman run --detach \
	--pod voip-db \
	--name mongo-db \
	--env MONGO_INITDB_ROOT_USERNAME="root" \
	--env MONGO_INITDB_ROOT_PASSWORD="example" \
	--env MONGO_INITDB_DATABASE="voip" \
	-p 27017:27017 \
	--volume voip-db-data:/data/db:z \
	docker.io/library/mongo:latest

#
