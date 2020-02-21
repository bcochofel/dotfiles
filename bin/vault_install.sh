#!/bin/bash

# install dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install curl unzip jq

# only do if vault is not found
if [ ! -f /usr/local/bin/vault ]; then

  echo -e '\e[38;5;198m'"++++ Vault not installed, installing.."

  LATEST_URL=$(curl -sL https://releases.hashicorp.com/vault/index.json | jq -r '.versions[].builds[].url' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'rc|ent|beta' | egrep 'linux.*amd64' | sort -V | tail -n 1)
  wget -q $LATEST_URL -O /tmp/vault.zip

  sudo mkdir -p /usr/local/bin
  sudo unzip /tmp/vault.zip -d /usr/local/bin
  echo -e '\e[38;5;198m'"++++ Installed `/usr/local/bin/vault --version`"
fi

exit 0
