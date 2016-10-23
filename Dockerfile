# DOCKER-VERSION  1.3.2

FROM ubuntu:14.04
MAINTAINER George Peden, georgep@slalom.com

ENV BOTDIR /opt/bot

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
ENV HUBOT_OWNER max
ENV HUBOT_NAME max
ENV HUBOT_ADAPTER slack
ENV HUBOT_DESCRIPTION Just a friendly robot named Max

# Override adapter with -env-file ./ENV
# CMD /usr/local/bin/yo hubot --adapter $HUBOT_ADAPTER --owner $HUBOT_OWNER --name $HUBOT_NAME --description $HUBOT_DESCRIPTION --defaults && bin/hubot --adapter $HUBOT_ADAPTER
WORKDIR /opt/bot

CMD bin/hubot --adapter $HUBOT_ADAPTER --owner $HUBOT_OWNER --name $HUBOT_NAME --description $HUBOT_DESCRIPTION --defaults && bin/hubot --adapter $HUBOT_ADAPTER
