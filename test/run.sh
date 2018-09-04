#!/bin/bash
# f5-terraform - Run Tests
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.3, 04/09/2018

set -xeo pipefail

REPO="artioml/f5-terraform"

# Terraform
str_TEST="terraform --version;"
str_TEST="$str_TEST find cfg/ -type d | while read dir; do terraform init $dir; done"

if [ "$TRAVIS" == "true" ]; then
	docker run $REPO /bin/sh -c "$str_TEST"
else
	eval "$str_TEST"
fi
