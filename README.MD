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

Copy **lando-wsl2-for-magento2** files to your Magento 2 project directory and run:

```bash
$ bash ./install.sh
```

This will create local environment and set file permissions. Don't forget to import database by using ***lando db-import*** and change database cridentials in *app/etc/env.php* then set base url for Magento.

```bash
lando ssh -c "bin/magento config:set web/secure/base_url https://magento.lndo.site/"

lando ssh -c "bin/magento config:set web/unsecure/base_url http://magento.lndo.site/"
```

Database cridentials:<br>
user: magento</br>
password: magento</br>
database: magento</br>

Database internal (inside local env) connection: *database:3306* </br>
Database external (outside local env) connection: *localhost:37013*

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
