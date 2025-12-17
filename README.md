# neo4jDock
Docker environment for Dashboard

start by cloning or downloading this repo
change directory into the cloned repodir
then install docker on your debian with the script setupDocker.sh
./setupDocker.sh
make .env file with NEO4J_PASSWORD=xxx
or choose no password 
NEO4J_AUTH=none
now you can start the neo4j and the dashboard server by 
docker compose ip -d


