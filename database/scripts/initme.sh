#!/bin/bash

echo "hello world"
sudo apt update
sudo apt install -y mongodb
sudo systemctl stop mongodb
# rm /etc/mongodb.conf
# nano /etc/mongodb.conf
sudo tee /etc/mongodb.conf << EOF

dbpath=/var/lib/mongodb
bind_ip = 0.0.0.0
EOF

sudo systemctl start mongodb
sudo ufw enable
sudo ufw allow from 0.0.0.0/0 to any port 27017  
sudo ufw allow ssh

sudo tee products.json << EOF

{ 
    "_id" : ObjectId("59be715b8a76061803c2cedb"), 
    "title" : "Veg Pizza", 
    "subTitle" : "Veg. Pizza", 
    "price" : 4.0, 
    "desc" : "Vegetarian Pizza", 
    "imageUrl" : "../../assets/vegpizza.jpeg"
}
{ 
    "_id" : ObjectId("59be716f8a76061803c2cedc"), 
    "title" : "Veg Burger", 
    "subTitle" : "Veg Burger", 
    "price" : 4.0, 
    "desc" : "Veg Burger", 
    "imageUrl" : "../../assets/vegburger.jpeg"
}
{ 
    "_id" : ObjectId("59be71788a76061803c2cede"), 
    "title" : "Veg. Springroll", 
    "subTitle" : "Veg. Springroll", 
    "price" : 4.0, 
    "desc" : "Veg. Springroll", 
    "imageUrl" : "../../assets/springroll.jpeg"
}
{ 
    "_id" : ObjectId("59be717c8a76061803c2cee0"), 
    "title" : "Hot toast", 
    "subTitle" : "Hot toast", 
    "price" : 4.0, 
    "desc" : "Hot toast", 
    "imageUrl" : "../../assets/hottoast.jpeg"
}
{ 
    "_id" : ObjectId("59be71828a76061803c2cee2"), 
    "title" : "Hamburger", 
    "subTitle" : "Hamburger", 
    "price" : 4.0, 
    "desc" : "Hamburger", 
    "imageUrl" : "../../assets/hamburger.jpeg"
}
{ 
    "_id" : ObjectId("59be71888a76061803c2cee4"), 
    "title" : "Fries", 
    "subTitle" : "Fries", 
    "price" : 4.0, 
    "desc" : "Fries", 
    "imageUrl" : "../../assets/fries.jpeg"
}
{ 
    "_id" : ObjectId("59be718f8a76061803c2cee6"), 
    "title" : "Fried checken", 
    "subTitle" : "Fried checken", 
    "price" : 4.0, 
    "desc" : "Fried checken", 
    "imageUrl" : "../../assets/friedchicken.jpeg"
}

EOF

sudo mongoimport --db meankube --collection products --type json --file products.json
