# installttomcat9
sudo yum install java-1.8.* -y
cd /opt
sudo yum install wget -y
sudo yum install net-tools -y 
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz
sudo tar -xvf apache-tomcat-9.0.96.tar.gz
sudo rm apache-tomcat-9.0.96.tar.gz
sudo mv apache-tomcat-9.0.96 tomcat9
sudo chmod 777 -R tomcat9
cd /opt/tomcat9
./bin/startup.sh
