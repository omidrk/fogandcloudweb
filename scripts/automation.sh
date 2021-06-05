##for backend 
#first deploy on 2 replicas. pass mongodb address as env
#process.env is equal to env.
#process.env.PORT #is the running nodejs app port
#process.env.MEANKUBE_DB_SERVICE_HOST = #mongo address here 127.0.0.1
#process.env.MEANKUBE_DB_SERVICE_PORT = #port here 27017

sudo kubectl create -f scripts/loadbalancer.yaml
MASTER_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $USER-control-plane`
echo "My cluster is available from outside world using its master node IP, which is $MASTER_IP"

sudo kubectl create -f scripts/lb_frontend.yaml

echo "check this out: curl http://$MASTER_IP:30005"
