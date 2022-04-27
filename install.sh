#!/bin/bash

if [ -z "$(ls -A ./)" ]; then

  echo "directory is empty"

else

  lando start
  lando xdebug-off

  echo "Set file permissions"
  lando ssh -c "find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +"
  lando ssh -c "find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +"
  lando ssh -c "chown -R :www-data ."
  lando ssh -c "chmod u+x bin/magento"

  lando restart

fi