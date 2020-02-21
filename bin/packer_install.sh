#!/bin/bash

# install dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install curl unzip jq

# check if packer is installed
if [ -f /usr/local/bin/packer ]; then
  echo -e '\e[38;5;198m'"++++ `/usr/local/bin/packer version` already installed at /usr/local/bin/packer"
else
  LATEST_URL=$(curl --silent https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux_amd.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')
  wget -q $LATEST_URL -O /tmp/packer.zip
  sudo mkdir -p /usr/local/bin
  sudo unzip /tmp/packer.zip -d /usr/local/bin
  echo -e '\e[38;5;198m'"++++ Installed: `/usr/local/bin/packer version`"
fi

exit 0
