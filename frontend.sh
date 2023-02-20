  LOG_FILE=/tmp/frontend
  echo Install nginx
  yum install nginx -y &>>$LOG-FILE
  echo status = $?

  echo downloading NIGINX web content
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG-FILE
 echo status = $?

 cd /usr/share/nginx/html &>>$LOG-FILE
 echo status = $?

 echo removing old files
 rm -rf * &>>$LOG-FILE
 echo status = $?

 echo unzip web content
 unzip /tmp/frontend.zip &>>$LOG-FILE
 echo status = $?

 mv frontend-main/static/* . &>>$LOG-FILE
 echo status = $?

 mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG-FILE
echo status = $?

 echo start NIGINX
  systemctl enable nginx &>>$LOG-FILE
 systemctl restart nginx &>>$LOG-FILE
echo status = $?