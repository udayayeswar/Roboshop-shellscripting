  echo Install nginx
  yum install nginx -y

  echo downloading NIGINX web content

 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
 cd /usr/share/nginx/html

 echo remaving old files
 rm -rf *
 echo unzip web content
 unzip /tmp/frontend.zip

 mv frontend-main/static/* .
 mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf

 echo start NIGINX
  systemctl enable nginx
 systemctl restart nginx
