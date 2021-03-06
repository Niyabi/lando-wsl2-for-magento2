# lando-wsl2-for-magento2

Local developement environment for Magento 2 based on Lando and WSL2. </br>
Project is based on this **[article](https://www.liip.ch/en/blog/setup-drupal-and-lando-with-wsl2-on-windows)**.

## Requirements

* [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [Ubuntu](https://www.microsoft.com/pl-pl/p/ubuntu/9nblggh4msv6)
* [Docker](https://www.docker.com/products/docker-desktop)
* [Lando](https://docs.lando.dev/)

Here is **[article](https://www.liip.ch/en/blog/setup-drupal-and-lando-with-wsl2-on-windows)** how to setup Lando inside WSL2 Ubuntu.

## Magento 2 installation

This local environment is for Magento 2 clean installation, for existing project check [existing-project branch](https://github.com/Niyabi/lando-wsl2-for-magento2/tree/existing-project)

Write your public and private access keys from Magento Marketplace into *config/env* file and state if you need Magento Sample Data by setting DEPLOY_SAMPLE_DATA to true or false.

Magento 2 will be installed in the *docroot* directory.
After installation store will be available at *magento.lndo.site* and admin panel at *magento.lndo.site/admin* with user:</br>
name: admin</br>
password: admin123</br>

To install Magento 2 run *install.sh* script

```bash
$ bash ./install.sh
```

Database cridentials:</br>
user: magento</br>
password: magento</br>
database: magento

Database internal (inside local env) connection: database:3306</br>
Database external (outside local env) connection: localhost:37013

For magento console commands use:
```bash
$ lando console <command>
```

for example:
```bash
$ lando console cache:flush
```

## Commands

* Start / build lando

```bash
$ lando start
```

* Stop lando

```bash
$ lando stop
```

* Magento console command
```bash
$ lando console <command>
```

* Rebuild lando app

```bash
$ lando rebuild
```

* Destroy app (containers, databse, NOT FILES!)

```bash
$ lando destroy
```

* Import database (supports .sql and sql.gz files)

```bash
$ lando db-import path/to/file.sql
```

* Export database

```bash
$ lando db-export path/to/file.sql
```

* Connect to container's shell

```bash
$ lando ssh
```

* Run command in container's shell (you have to be in docroot directory)

```bash
$ lando ssh -c <command>
```

* Enable xdebug

```bash
$ lando xdebug-on
```

* Disable xdebug

```bash
$ lando xdebug-off
```

* Node command

```bash
lando node <command>
```

* NPM command

```bash
lando npm <command>
```

* Grunt command

```bash
lando grunt <command>
```
