# neo4jDock
Docker environment for Dashboard

start by cloning or downloading this repo  <br>
change directory into the cloned repodir <br>

then install docker on your debian with the script setupDocker.sh <br>
./setupDocker.sh <br>

make .env file with initial password must be 8 chars at least  
NEO4J_PASSWORD=xxx <br>
or choose no password  NEO4J_AUTH=none <br>

now you can start the neo4j and the dashboard server by  <br>
docker compose up -d <br>

connect to the database in browser  <br>
http://localhost:7474/browser/ <br>
user:neo4j  <br>
pw:xxx <br>

connect to the dashboard  <br>
http://localhost:5005/ <br>
by choosing create new <br>
protocol: bolt  <br>
hostname: 127.0.0.1 <br>
port: 7687 <br>
database: neo4j <br>
username: neo4j <br>
password:xxx <br>

see services running by executing  <br>
ss -tulpen <br>

stop everythin by <br>
docker compose down <br>

look for errors <br>
docker logs --tail=200 neo4j <br>

see containers running by <br>
docker ps
CONTAINER ID   IMAGE                      COMMAND                  CREATED         STATUS                            PORTS                                                                                                NAMES
581b38943258   neo4jlabs/neodash:latest   "/docker-entrypoint.…"   5 seconds ago   Up 4 seconds (health: starting)   80/tcp, 0.0.0.0:5005->5005/tcp, [::]:5005->5005/tcp                                                  neodash
d99fa364f2c1   neo4j:5                    "tini -g -- /startup…"   5 seconds ago   Up 5 seconds                      0.0.0.0:7474->7474/tcp, [::]:7474->7474/tcp, 7473/tcp, 0.0.0.0:7687->7687/tcp, [::]:7687->7687/tcp   neo4j

