#!/bin/bash

# install dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install curl unzip jq

# check if terraform is installed
if [ -f /usr/local/bin/terraform ]; then
  echo -e '\e[38;5;198m'"++++ `/usr/local/bin/terraform version` already installed at /usr/local/bin/terraform"
else
  LATEST_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'rc|beta' | egrep 'linux.*amd64' | sort -V | tail -n1)
  wget -q $LATEST_URL -O /tmp/terraform.zip
  mkdir -p /usr/local/bin
  (cd /usr/local/bin && unzip /tmp/terraform.zip)
  echo -e '\e[38;5;198m'"++++ Installed: `/usr/local/bin/terraform version`"
fi

exit 0
