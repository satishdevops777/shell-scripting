
GREEN = "\e[32m"
RESET = \e[0m"

"${GREEN}Installing Nginx ${RESET}"
dnf install nginx -y 

"${GREEN}Enable and Start Nginx ${RESET}"
systemctl enable nginx 
systemctl start nginx 

"${GREEN}Remove and download app code ${RESET}"
rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 
cd /usr/share/nginx/html 

"${GREEN}Unzipping Frontend Application ${RESET}"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

"${GREEN}Deploying Frontend Application ${RESET}"
mv roboshop.conf /etc/nginx/default.d/roboshop.conf 

"${GREEN}Deploying Frontend Application ${RESET}"
systemctl restart nginx 