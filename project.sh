#! /bin/bash

# App To Run
APP_PATH="/var/www/Server";
APP_MAIN="/var/www/Server/app.js";

# Launch PM2
. ~/.nvm/nvm.sh; \
  npm install -g pm2; && \
  cd $APP_PATH; && \
  npm install; && \
  NODE_ENV=production pm2 start $APP_MAIN
