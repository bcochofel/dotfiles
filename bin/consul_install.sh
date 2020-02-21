#!/bin/bash

# install dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install curl unzip jq

# check if consul is installed, start and exit
if [ -f /usr/local/bin/consul ]; then
  echo -e '\e[38;5;198m'"++++ Consul already installed at /usr/local/bin/consul"
  echo -e '\e[38;5;198m'"++++ `/usr/local/bin/consul version`"
else
  # if consul is not installed, download and install
  echo -e '\e[38;5;198m'"++++ Consul not installed, installing.."
  LATEST_URL=$(curl -sL https://releases.hashicorp.com/consul/index.json | jq -r '.versions[].builds[].url' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'rc|ent|beta' | egrep 'linux.*amd64' | sort -V | tail -1)
  wget -q $LATEST_URL -O /tmp/consul.zip
  sudo mkdir -p /usr/local/bin
  sudo unzip /tmp/consul.zip -d /usr/local/bin
  echo -e '\e[38;5;198m'"++++ Installed `/usr/local/bin/consul version`"
fi

exit 0
