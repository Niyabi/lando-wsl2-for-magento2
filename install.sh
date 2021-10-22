bin/magento setup:install \
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
    --admin-password=admin123

bin/magento config:set web/secure/base_url https://magento2.lndo.site/
bin/magento config:set web/unsecure/base_url https://magento2.lndo.site/
bin/magento module:disable Magento_TwoFactorAuth
bin/magento setup:di:compile

bin/magento deploy:mode:set developer
bin/magento sampledata:deploy
bin/magento setup:upgrade
bin/magento c:f