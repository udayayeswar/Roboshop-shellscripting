  echo Install nginx
  yum install nginx -y &>>/tmp/frontend

  echo downloading NIGINX web content

 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/frontend
 cd /usr/share/nginx/html &>>/tmp/frontend

 echo remaving old files
 rm -rf * &>>/tmp/frontend
 echo unzip web content
 unzip /tmp/frontend.zip &>>/tmp/frontend

 mv frontend-main/static/* . &>>/tmp/frontend
 mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/frontend

 echo start NIGINX
  systemctl enable nginx &>>/tmp/frontend
 systemctl restart nginx &>>/tmp/frontend
