# <img align="center" src="img/terraform.svg" width="70">&nbsp;&nbsp; f5-terraform
[![Build Status](https://img.shields.io/travis/com/ArtiomL/f5-terraform/develop.svg)](https://travis-ci.com/ArtiomL/f5-terraform)
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
- [Installation](#installation)
	- [Run](#run)
	- [Credentials](#credentials)
- [Extensibility](#extensibility)
- [Modules](#modules)
- [License](LICENSE)

&nbsp;&nbsp;

## Description

Multi-cloud Infrastructure as Code with declarative modules and configuration files.

&nbsp;&nbsp;

## Installation

### Run
```shell
# Terraform v0.11.9
docker run -it artioml/f5-terraform

```

### Credentials


&nbsp;&nbsp;

## Extensibility
The container will dynamically pull down (and `cd` to) whatever GitHub repository is specified in the `REPO` environment variable. This enables Continuous Delivery of new content every time the container is started and that repository is updated. It also allows you to load and run your own custom Ansible environments.

```shell
-e "REPO=<GitHub_Username>/<Repo_Name>"
```
For [example](https://github.com/ArtiomL/terraform-do):
```shell
docker run -it -e "REPO=artioml/terraform-do" artioml/f5-terraform
```

&nbsp;&nbsp;


