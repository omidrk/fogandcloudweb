
sudo docker build -t nodeback ./backend/meankube-api
sudo docker build -t meanfront ./frontend/meankube-web

#transfer these images to kubectl
sudo kind load docker-image nodeback --name omid.jadidi
sudo kind load docker-image meanfront --name omid.jadidi
