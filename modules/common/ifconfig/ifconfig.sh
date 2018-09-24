#!/bin/sh
# f5-terraform - Get Public IP Address
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.0, 24/09/2018

set -eo pipefail

strIP=$(wget -qO- ifconfig.co)

jq -n --arg ip "$strIP" '{"ip":$ip}'
