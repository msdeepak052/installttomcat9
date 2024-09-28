# installttomcat9
sudo yum install java-1.8.0-openjdk-devel -y
cd /opt
sudo yum install wget -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz
sudo tar -xvf apache-tomcat-9.0.95.tar.gz
sudo rm apache-tomcat-9.0.95.tar.gz
sudo mv apache-tomcat-9.0.95 tomcat9
sudo chmod 777 -R tomcat9
cd /opt/tomcat9
./bin/startup.sh
