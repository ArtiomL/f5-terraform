# f5-terraform - Dockerfile
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.3, 05/09/2018

FROM alpine

LABEL maintainer="Artiom Lichtenstein" version="1.0.3"

# Core dependencies
RUN apk add --update --no-cache coreutils curl git jq && \
	rm -rf /var/cache/apk/*

# Terraform
COPY / /opt/terraform/
WORKDIR /opt/terraform/
RUN wget -O terraform.zip $(curl -sL https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}') && \
	unzip terraform.zip && \
	rm terraform.zip && \
	mv terraform /usr/local/bin/

# System account and permissions
RUN adduser -u 1001 -D user
COPY .creds /home/user/
RUN chown -RL user: /opt/terraform/ /home/user/
RUN chmod +x scripts/start.sh

# UID to use when running the image and for CMD
USER 1001

# Run
CMD ["scripts/start.sh"]
