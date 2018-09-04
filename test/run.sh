#!/bin/bash
# f5-terraform - Run Tests
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.3, 04/09/2018

set -xeo pipefail

REPO="artioml/f5-terraform"

# Terraform
str_TEST="terraform --version;"
str_TEST="$str_TEST terraform init cfg/aws/dev;"
str_TEST="$str_TEST terraform init cfg/aws/stg;"
str_TEST="$str_TEST terraform init cfg/aws/prod;"
str_TEST="$str_TEST terraform init cfg/azure/dev;"

if [ "$TRAVIS" == "true" ]; then
	docker run $REPO /bin/sh -c "$str_TEST"
else
	eval "$str_TEST"
fi
