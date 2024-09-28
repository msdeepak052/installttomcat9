#!/bin/bash

# Update the package index
sudo yum update -y

# Install Java
sudo yum install java-1.8.0-openjdk-devel -y

# Install wget
sudo yum install wget -y

# Download and install Tomcat
cd /opt
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz
sudo tar -xvf apache-tomcat-9.0.95.tar.gz
sudo rm apache-tomcat-9.0.95.tar.gz
sudo mv apache-tomcat-9.0.95 tomcat9
sudo chmod 777 -R tomcat9

# Create a systemd service file for Tomcat
cat <<EOL | sudo tee /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=simple
User=root
Group=root
Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
Environment=CATALINA_HOME=/opt/tomcat9
Environment=CATALINA_BASE=/opt/tomcat9
ExecStart=/opt/tomcat9/bin/startup.sh
ExecStop=/opt/tomcat9/bin/shutdown.sh
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd to recognize the new service
sudo systemctl daemon-reload

# Enable the Tomcat service to start on boot
sudo systemctl enable tomcat

# Start the Tomcat service
sudo systemctl start tomcat

# Check the status of the Tomcat service
sudo systemctl status tomcat
