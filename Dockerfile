FROM ubuntu:14.04
MAINTAINER Active 9 LLC

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

WORKDIR /src

ENV PROJ_DIR /var/www
ENV NVM_DIR /usr/local/nvm
ENV PATH $NVM_DIR/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

# Your NodeJS Project Files
RUN mkdir $PROJ_DIR
ADD process.json $PROJ_DIR/process.json
ADD Server/app.js $PROJ_DIR/Server/app.js
ADD Server/package.json $PROJ_DIR/Server/package.json
ADD onProvisioned.sh /onProvisioned.sh

# Expose Port 8080
EXPOSE 8080

# This is not 'best practice'
RUN apt-get update
RUN apt-get install -y python-software-properties screen build-essential libssl-dev curl python git-core
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list
RUN apt-get update
COPY .nvmrc /src/.nvmrc
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash && \
    echo 'source $NVM_DIR/nvm.sh' >> ~/.profile && \
    /bin/bash -l -c "nvm install;" \
"nvm use;"

# App To Run
ENV APP_PATH /var/www/Server
ENV APP_MAIN /var/www/process.json

# Launch PM2
CMD . $NVM_DIR/nvm.sh; \
  npm install -g Unitech/pm2#development && \
  cd $APP_PATH && \
  npm install && \
  cd .. && \
  pm2-docker start $APP_MAIN --auto-exit;

# Trigger Upon Privisioned
RUN . /onProvisioned.sh
