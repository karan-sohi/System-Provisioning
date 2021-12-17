sudo useradd -m -d /backend backend
sudo -u backend -i git clone https://github.com/bezkoder/nodejs-express-sequelize-mysql backend
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo -u backend -i npm install --prefix /backend/backend
sudo apt install -y mysql-server
sudo mysql < "files/backend/db_init.sql"
sudo rm /backend/backend/app/config/db.config.js
sudo cp ~/files/backend/db_config.js /backend/backend/app/config/db.config.js

