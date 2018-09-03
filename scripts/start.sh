#!/bin/sh
# f5-terraform - Docker Wrapper Script
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.1, 03/09/2018

if [[ ! -z "$REPO" ]]; then
	git clone "https://github.com/$REPO.git"
	cd $(echo "$REPO" | cut -d"/" -f2)
fi

export $(cat /home/user/.azure/credentials | tr '\n' ' ')

exec /bin/sh
