#!/bin/bash
# f5-terraform - Run Tests
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.0, 31/08/2018

set -xeo pipefail

REPO="artioml/f5-terraform"

# Terraform
str_TEST="terraform --version;"
str_TEST="$str_TEST cd cfg/prod;"
str_TEST="$str_TEST terraform init;"

if [ "$TRAVIS" == "true" ]; then
	docker run $REPO /bin/sh -c "$str_TEST"
else
	eval "$str_TEST"
fi
