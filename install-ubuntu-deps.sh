#!/bin/sh
jmeterVersion="5.6.3"
mavenVersion="3.9.8"

apt install -y npm
npm install -g newman
wget https://download.visualstudio.microsoft.com/download/pr/022d9abf-35f0-4fd5-8d1c-86056df76e89/477f1ebb70f314054129a9f51e9ec8ec/dotnet-sdk-2.2.207-linux-x64.tar.gz
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-$jmeterVersion.zip
wget https://dlcdn.apache.org/maven/maven-3/$mavenVersion/binaries/apache-maven-$mavenVersion-bin.zip

tar -xzf dotnet-sdk-2.2.207-linux-x64.tar.gz
unzip apache-jmeter-$jmeterVersion.zip
unzip apache-maven-$mavenVersion-bin.zip  

echo "export PATH=\$PATH:/usr/local/apache-maven-$mavenVersion/bin" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/local/apache-jmeter-$jmeterVersion/bin" >> ~/.bashrc
source ~/.bashrc
