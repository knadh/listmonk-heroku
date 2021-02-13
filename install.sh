#!/bin/sh

# Write the config.
erb config/listmonk.toml.erb > config/listmonk.toml  

# Download the latest release.
URL=$( curl -s https://api.github.com/repos/knadh/listmonk/releases | grep -m 1 -o 'https://.*linux_amd64.tar.gz' )

curl -fsSL $URL | tar xzf -

# Install the DB schema.
./listmonk --config=config/listmonk.toml --install --yes
