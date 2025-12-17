# neo4jDock
Docker environment for Dashboard

start by cloning or downloading this repo  <br>
change directory into the cloned repodir <br>

then install docker on your debian with the script setupDocker.sh <br>
./setupDocker.sh <br>

make .env file with initial password NEO4J_PASSWORD=xxx <br>
or choose no password  NEO4J_AUTH=none <br>

now you can start the neo4j and the dashboard server by  <br>
docker compose ip -d <br>


