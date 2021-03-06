#Excecute docker commands remotely
docker -H tcp://10.18.24.142:2375 images

sudo docker  -H tcp://<master_ip>:2375 run --rm swarm create
a02205a0787be77522d2ba4c938df879

#SETUP NODES
docker -H tcp://<node_1_ip>:2375 run -d swarm join --addr=<node1_ip>:2375 token://<cluster_token>
docker -H tcp://10.18.24.188:2375 run -d swarm join --addr=10.18.24.188:2375 token://a02205a0787be77522d2ba4c938df879

docker -H tcp://10.18.24.192:2375 run -d swarm join --addr=10.18.24.192:2375 token://a02205a0787be77522d2ba4c938df879

docker -H tcp://$MANAGER_HOST_IP:22222 run -itd --net swarm-network -e constraint:node==n1 --name u1 ubuntu
docker -H tcp://$MANAGER_HOST_IP:22222 run -itd --net swarm-network -e constraint:node==n2 --name u2 ubuntu
