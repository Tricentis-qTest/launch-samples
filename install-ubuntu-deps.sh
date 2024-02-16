#!/bin/sh
apt install -y maven jmeter npm
npm install -g newman
wget https://download.visualstudio.microsoft.com/download/pr/022d9abf-35f0-4fd5-8d1c-86056df76e89/477f1ebb70f314054129a9f51e9ec8ec/dotnet-sdk-2.2.207-linux-x64.tar.gz
tar -xzf dotnet-sdk-2.2.207-linux-x64.tar.gz
