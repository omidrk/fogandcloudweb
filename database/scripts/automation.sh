# download ubuntu image on main server

wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img
#download github repo
git clone https://github.com/omidrk/fogandcloudweb.git
#cd fogandcloudweb/database/
#download web-app-project open-rc file and use it from web gui.
source ./openrc/memberrc.sh


#upload image to openstack

openstack image create --public\
    --container-format bare \
    --disk-format qcow2 \
    --file bionic-server-cloudimg-amd64.img \
    ubuntu-18
    
#create project
#Createing roles
#project-user, project-reader, project-admin,project-eval

#create project
projectID=$(openstack project create --description 'Web application' web-app-project --domain default -f json | jq -r '.id' )
echo $projectID

#create user
useradminID=$(openstack user create --project web-app-project --password #password new-user -f json | jq -r '.id' )

##create member user
memberuserID=$(openstack user create --project web-app-project --password password web-member -f json | jq -r '.id' )

##create eval user
evaluserID=$(openstack user create --project web-app-project --password password eval -f json | jq -r '.id' )

#assign role
openstack role add --user web-admin --project web-app-project admin
openstack role add --user web-member --project web-app-project member
openstack role add --user eval --project web-app-project reader

#download web-app-project open-rc file and use it from web gui.
source ./openrc/memberrc.sh

#terraform automation
cd fogandcloudweb/database/
terraform init 
terraform apply -auto-approve 

#Download github repo

#download admin openrc file to use openstack commands, put in main directory.
#sudo mkdir openrc
#source openrc/memberrc.sh

#######docs for user,project,roles
##  https://docs.openstack.org/keystone/queens/admin/cli-manage-projects-users-and-roles.html

##set ssh permision for user:
#sudo chmod 600 ./keys/...

#####mongodb menual install
#sudo apt update
#sudo apt install -y mongodb
#sudo systemctl status mongodb
#mongo --eval 'db.runCommand({ connectionStatus: 1 })'
#sudo systemctl status mongodb
#sudo systemctl stop mongodb
#sudo systemctl start mongodb
#sudo systemctl restart mongodb
#sudo systemctl disable mongodb
#sudo systemctl enable mongodb

#sudo ufw allow from your_other_server_ip/32 to any port 27017  
#sudo ufw status
#sudo nano /etc/mongodb.conf
#sudo systemctl restart mongodb

#runcmd:
# - sudo apt update
# - sudo apt install -y mongodb

#terraform apply -auto-approve -backup=backup -state=state



