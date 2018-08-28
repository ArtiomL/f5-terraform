# <img align="center" src="img/terraform.svg" width="70">&nbsp;&nbsp; f5-terraform
[![Build Status](https://img.shields.io/travis/ArtiomL/f5-terraform/develop.svg)](https://travis-ci.org/ArtiomL/f5-terraform)
[![Releases](https://img.shields.io/github/release/ArtiomL/f5-terraform.svg)](https://github.com/ArtiomL/f5-terraform/releases)
[![Commits](https://img.shields.io/github/commits-since/ArtiomL/f5-terraform/latest.svg?label=commits%20since)](https://github.com/ArtiomL/f5-terraform/commits/master)
[![Maintenance](https://img.shields.io/maintenance/yes/2018.svg)](https://github.com/ArtiomL/f5-terraform/graphs/code-frequency)
[![Issues](https://img.shields.io/github/issues/ArtiomL/f5-terraform.svg)](https://github.com/ArtiomL/f5-terraform/issues)
[![Docker Hub](https://img.shields.io/docker/pulls/artioml/f5-terraform.svg)](https://hub.docker.com/r/artioml/f5-terraform/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)
[![Slack Status](https://f5cloudsolutions.herokuapp.com/badge.svg)](https://f5cloudsolutions.herokuapp.com)

&nbsp;&nbsp;

## Table of Contents
- [Description](#description)



```
terraform apply \
	-var 'aws_region=eu-central-1' \
	-var 'tag_name=F5Labs' \
	-var 'vpc_cidr=10.200.0.0/16' \
	-var 'mgmt_cidr=10.200.113.0/24' \
	-var 'ext_cidr=10.200.115.0/24' \
	-var 'int_cidr=10.200.112.0/24' \
	-var 'key_path=/home/user/.ssh/id_rsa.pub' \
	-var 'mgmt_asrc=["0.0.0.0/0"]'
```


```
docker run -it \
	-v /path/to/your/id_rsa.pub:/home/user/.ssh/id_rsa.pub \
	-v /path/to/your/credentials:/home/user/.aws/credentials \
	artioml/f5-terraform
```
