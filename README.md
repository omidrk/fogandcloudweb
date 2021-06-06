# fogandcloudweb
Fog and cloud project
# Intro:
This is cloud solution using openstack as IaaS and Kubernetes as PaaS for deploying MEAN Stack (MongoDB,NodeJs,Express,Angular) web application using cloud infrastructure.
## Steps
### Database.
Our database is deployed on openstack vm using terraform automation.
- Project, User, Role creating and using them for deploying DB.
- Ubuntu cloud-init image upload.
- Using terraform for automation: SSH creation, network creation and assignments, vm instance creation and mongodb installation script using cloud-init ubuntu image. 


Automation scripts can be found in database/scripts directory. database/scripts/initme.sh is used for database installation and configuration.
## PaaS machine
# configuration
The main logic on the deployment is eachtime on both front-end and back-end user will make a docker image which can be found on Docker file on both backend and frontend directories. the script which is based on Node docker image will install all the dependencies and eventually uploud it to kubernetes. Under the script directory you can find scripts necessary to building webapplication.( scripts/build_docker_images.sh)
Also automation script is for deploying 2 replicas for backend and 2 replicas for frontend and loud balancer which is exposed on port 30000 for backend and 30005 for frontend.
