#!/bin/bash

source ./config/env
WORKDIR=./docroot

if [ ! -d $WORKDIR ]; then
  mkdir ./docroot
fi

if [ -z "$(ls -A $WORKDIR)" ]; then

  lando start
  lando xdebug-off
  cd ./docroot

  echo "Creating magento project"
  lando composer --no-plugins config --global http-basic.repo.magento.com $PUBLIC_KEY $PRIVATE_KEY
  lando composer --no-plugins create-project --no-install --repository-url=https://repo.magento.com/ magento/project-community-edition .

  echo "Installing magento dependencies"
  lando composer --no-plugins config http-basic.repo.magento.com $PUBLIC_KEY $PRIVATE_KEY
  lando composer --no-plugins install --no-interaction --ignore-platform-reqs

  echo "Install magento"
  lando ssh -c 'bin/magento setup:install \
    --db-host=database \
    --db-name=magento \
    --db-user=magento \
    --db-password=magento \
    --language=en_US \
    --currency=USD \
    --timezone=Europe/Warsaw \
    --use-rewrites=1 \
    --session-save=redis \
    --session-save-redis-host=redis \
    --session-save-redis-port=6379 \
    --session-save-redis-db=0 \
    --session-save-redis-disable-locking=1 \
    --cache-backend=redis \
    --cache-backend-redis-server=redis \
    --cache-backend-redis-db=0 \
    --cache-backend-redis-port=6379 \
    --page-cache=redis \
    --page-cache-redis-server=redis \
    --page-cache-redis-db=1 \
    --page-cache-redis-port=6379 \
    --backend-frontname="admin" \
    --search-engine=elasticsearch7 \
    --elasticsearch-host=elasticsearch \
    --elasticsearch-port=9200 \
    --elasticsearch-index-prefix magento \
    --admin-firstname=Magento \
    --admin-lastname=User \
    --admin-email=user@example.com \
    --admin-user=admin \
    --admin-password=admin123'

  lando ssh -c "bin/magento config:set web/secure/base_url https://magento2.lndo.site/"
  lando ssh -c "bin/magento config:set web/unsecure/base_url https://magento2.lndo.site/"
  lando ssh -c "bin/magento module:disable Magento_TwoFactorAuth"
  lando ssh -c "bin/magento setup:di:compile"

  echo "Set developer mode"
  lando ssh -c "bin/magento deploy:mode:set developer"

  if [ "$DEPLOY_SAMPLE_DATA" = true ]; then
    echo "Deploying sample data"
    lando ssh -c "bin/magento sampledata:deploy"
    lando ssh -c "bin/magento setup:upgrade"
    lando ssh -c "bin/magento c:f"
  fi

  lando ssh -c "bin/magento cron:install"
  cd ../
  lando restart
  lando xdebug-off

else
  echo "docroot directory is not empty"
fi