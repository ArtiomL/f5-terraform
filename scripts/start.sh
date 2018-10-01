#!/bin/sh
# f5-terraform - Docker Wrapper Script
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.4, 01/10/2018

# Extensibility
if [[ ! -z "$REPO" ]]; then
	git clone "https://github.com/$REPO.git"
	cd $(echo "$REPO" | cut -d"/" -f2)
fi

# Azure RM environment variables
if [[ -f "/home/user/.azure/credentials" ]]; then
	export $(cat /home/user/.azure/credentials | tr '\n' ' ')
	export $(cat /home/user/.azure/credentials | tr '[:upper:]' '[:lower:]' | sed 's/^/TF_VAR_/' | tr '\n' ' ')
fi

# GCP environment variables
if [[ -f "/home/user/.gcp/credentials" ]]; then
	export GOOGLE_APPLICATION_CREDENTIALS=/home/user/.gcp/credentials
	export GOOGLE_PROJECT=$(jq -r '.project_id' /home/user/.gcp/credentials)
fi

# DigitalOcean environment variables
if [[ -f "/home/user/.do/credentials" ]]; then
	export $(cat /home/user/.do/credentials | tr '\n' ' ')
fi

exec /bin/sh
