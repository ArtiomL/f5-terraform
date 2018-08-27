#!/bin/sh
# f5-terraform - Docker Wrapper Script
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.0, 27/08/2018

if [[ ! -z "$REPO" ]]; then
	git clone "https://github.com/$REPO.git"
	cd $(echo "$REPO" | cut -d"/" -f2)
fi

exec /bin/sh
