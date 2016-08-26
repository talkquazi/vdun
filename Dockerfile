FROM ubuntu:14.04
MAINTAINER Active 9 LLC

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

WORKDIR /src

ENV PROJ_DIR /var/www
ENV NVM_DIR /usr/local/nvm
ENV PATH $NVM_DIR/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

# Your NodeJS Project Files
RUN mkdir $PROJ_DIR
ADD Server/app.js $PROJ_DIR/Server/app.js
ADD Server/package.json $PROJ_DIR/Server/package.json

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

ADD project.sh /project.sh

EXPOSE 80

CMD ["/bin/bash", "/project.sh"]