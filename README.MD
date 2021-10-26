# lando-wsl2-for-magento2

Local developement environment for Magento 2 based on Lando and WSL2. </br>
Project is based on this **[article](https://www.liip.ch/en/blog/setup-drupal-and-lando-with-wsl2-on-windows)**.

## Requirements

* [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [Ubuntu](https://www.microsoft.com/pl-pl/p/ubuntu/9nblggh4msv6)
* [Docker](https://www.docker.com/products/docker-desktop)
* [Lando](https://docs.lando.dev/)

Here is **[article](https://www.liip.ch/en/blog/setup-drupal-and-lando-with-wsl2-on-windows)** how to setup Lando inside WSL2 Ubuntu

## Magento 2 installation

Write your public and private access keys from Magento Marketplace into *config/env* file

Run *install.sh* script

```bash
$ sudo ./install.sh
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

* Rebuild lando app

```bash
$ lando rebuild
```

* Destroy app (containers, databse, NOT FILES!)

```bash
$ lando destroy
```

* Import database

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
