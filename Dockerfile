# DOCKER-VERSION  1.3.2

FROM ubuntu:14.04
MAINTAINER George Peden, georgep@slalom.com


ENV BOTDIR /opt/bot

RUN apt-get update && \
    apt-get install -y python-pip && \
    pip install awscli

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y wget && \
  wget -q -O - https://deb.nodesource.com/setup_6.x | sudo bash - && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y git build-essential nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  git clone --depth=1 https://github.com/gpeden/peden-hubot.git ${BOTDIR}


WORKDIR ${BOTDIR}

RUN npm install

# USER hubot

# optionally override variables with docker run -e HUBOT_...
# Modify ./ENV file to override these options
ENV PORT ${HUBOT_PORT}
EXPOSE ${HUBOT_PORT}

WORKDIR /opt/bot

CMD ["/bin/sh", "-c", "aws s3 cp --region us-west-2 s3://peden-hubot-secrets/env.sh .; . ./env.sh; bin/hubot --adapter slack"]
