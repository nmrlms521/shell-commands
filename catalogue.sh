echo disable node js
dnf module disable nodejs -y
echo enable node js
dnf module enable nodejs:20 -y

echo install node js
dnf install nodejs -y

echo add user
useradd roboshop
cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo create a directory
mkdir /app

echo download application content
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

echo npm install
cd /app
npm install

echo install mongo
dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.smks.online </app/db/master-data.js

echo restary catalogue service
systemctl enable catalogue
systemctl restart catalogue