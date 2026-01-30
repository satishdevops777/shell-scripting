
GREEN = "\e[32m"
RESET = "\e[0m"

echo -e "${GREEN}Installing Nginx ${RESET}"
dnf install nginx -y 

echo -e "${GREEN}Enable and Start Nginx ${RESET}"
systemctl enable nginx 
systemctl start nginx 

echo -e "${GREEN}Remove and download app code ${RESET}"
rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 
cd /usr/share/nginx/html 

echo -e "${GREEN}Unzipping Frontend Application ${RESET}"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "${GREEN}Copying roboshop.conf file ${RESET}"
mv roboshop.conf /etc/nginx/default.d/roboshop.conf 

echo -e "${GREEN}Restarting Nginx ${RESET}"
systemctl restart nginx 
