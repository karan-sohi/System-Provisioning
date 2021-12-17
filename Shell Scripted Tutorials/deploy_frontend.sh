git clone https://github.com/bezkoder/react-crud-web-api.git frontend
sudo npm install --prefix frontend
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
sudo rm /etc/nginx/sites-enabled/default
sudo cp ~/files/default-nginx.conf /etc/nginx/sites-enabled/default
sudo systemctl restart nginx
sudo rm frontend/src/http-common.js
sudo cp files/frontend/http-common.js frontend/src/http-common.js
npm run-script build --prefix frontend
sudo cp files/backend/tutorials.service /etc/systemd/system/tutorials.service
sudo systemctl enable tutorials
sudo systemctl start tutorials
sudo systemctl daemon-reload
sudo systemctl restart nginx
