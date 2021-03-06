---
title: PMS
classes: wide
---

PMS is a framework for using different shells along with various "dotfiles".
It supports easy install/uninstall and a wide variety of plugins and themes.

![CI](https://github.com/JoshuaEstes/pms/workflows/CI/badge.svg?branch=master)

# Features
* [Themes](/pms/themes.html) - Change the way your environment looks
* [Plugins](/pms/plugins.html) - Change the way your environment functions
* Dotfiles - Change the way programs work in your environment
* Multiple Shell Support
  * No matter the shell, you can easily swap between them and maintain similar functionality
* PMS Manager - Easy to use and up modify tool to help you manage PMS
  * Easy upgrade PMS
  * Preview and switch themes
  * Easy Plugin enabled and disable
* Focus on using environment variables to modify functionality of PMS
* Easy Uninstall process that leaves your system in the ordinal state before installing PMS
* Easy to extend and overwrite any file, even the PMS core
* [View All Features](/pms/features.html)

# Getting Started
## Requirements
* MacOS or Linux (could work on windows, but I don't use windows)
* curl or wget
* git
* A shell such as bash, zsh, etc.

## Installation
Installation can be done manually or by using curl or wget.

### Using curl
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/JoshuaEstes/pms/master/scripts/install.sh)"
```

### Using wget
```
sh -c "$(wget -O- https://raw.githubusercontent.com/JoshuaEstes/pms/master/scripts/install.sh)"
```

### Manual install
```
curl -Lo install.sh https://raw.githubusercontent.com/JoshuaEstes/pms/master/scripts/install.sh
sh install.sh
```

## Updating PMS using the PMS Manager
### auto
```
pms upgrade
```

### Manual update
```
cd $PMS
git pull origin master
# Copy over new template files
# cp ~/.pms/templates/bashrc ~/.bashrc
# ...
```

# Shells
PMS supprts a number of different shells. Switching from one shell to another
is easy and allows you to compare which shell works best for you and your needs.

To see a list of shells on your system, you can run `cat /etc/shells`

If PMS does not support your shell, please open an issue.

# Uninstall
By default, PMS in installed in `~/.pms` directory. You will just need to run
the "uninstall" script and this will revert you system back to how it was before
you installed PMS.

```
cd $PMS && ./scripts/uninstall.sh
```

# License
See [LICENSE.md](https://github.com/JoshuaEstes/pms/blob/master/LICENSE.md)
