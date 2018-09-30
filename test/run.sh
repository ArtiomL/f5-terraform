#!/bin/bash
# f5-terraform - Run Tests
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.5, 30/09/2018

set -xeo pipefail

REPO="artioml/f5-terraform"

# Terraform
str_TEST="terraform --version; \
	cp -n cfg/aws/dev/* cfg/aws/adct/; \
	find cfg/ env/ modules/ -type d -print0 | xargs -0 -n1 -t terraform init"

if [ "$TRAVIS" == "true" ]; then
	docker run $REPO /bin/sh -c "$str_TEST"
else
	eval "$str_TEST"
fi
