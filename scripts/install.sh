#!/usr/bin/env sh
#
# Environment Variables
#   PMS         = path to PMS repository
#   PMS_DEBUG   = 1 = enabled, 0 = disabled
#   PMS_REPO    = default: JoshuaEstes/pms
#   PMS_REMOTE  = default: https://github.com/$PMS_REPO.git
#   PMS_BRANCH  = master
#
set -ex
PMS=${PMS:-~/.pms}
PMS_DEBUG=${PMS_DEBUG:-1}
PMS_REPO=${PMS_REPO:-JoshuaEstes/pms}
PMS_REMOTE=${PMS_REMOTE:-https://github.com/${PMS_REPO}.git}
PMS_BRANCH=${PMS_BRANCH:-master}

setup_pms() {
  echo "Setting up PMS..."

  if [ -d $PMS ]; then
    echo "$PMS already exists, should we update instead of install? Or should we blow it away and re-install?"
    exit 1
  else
    git clone --branch "$PMS_BRANCH" "$PMS_REMOTE" "$PMS"
  fi

  # Copy over config files if they do not currently exist
  if [ ! -f ~/.env ]; then
    cp $PMS/templates/env ~/.env
  fi
  if [ ! -f ~/.pms.theme ]; then
    cp $PMS/templates/pms.theme ~/.pms.theme
  fi
  if [ ! -f ~/.pms.plugins ]; then
    cp $PMS/templates/pms.plugins ~/.pms.plugins
  fi

  echo
}

_setup_shell_rc() {
 if [ -f ~/.$1 ] || [ -h ~/.$1 ]; then
   echo "Found existing .$1 file, backing up"
   if [ ! -f ~/.$1.pms.bak ]; then
     echo "Moving ~/.$1 -> ~/.$1.pms.bak"
     mv -f ~/.$1 ~/.$1.pms.bak
   fi
 fi
 echo "Copy $PMS/templates/$1 -> ~/.$1"
 cp -f $PMS/templates/$1 ~/.$1
 echo
}

# Setup dotfiles
#   Setup various dotfiles and config files that PMS will use. Some dotfiles
#   may get modified later by plugins. Any dotfile that we find, needs to be
#   backed up so that the uninstall script can put everything back the way
#   we found it
setup_rcfiles() {
  echo "Setting up dotfiles"
  _setup_shell_rc bashrc
  _setup_shell_rc zshrc
}

# Setup shell
#   The user should be allowed to keep their current shell, or have the option
#   to change that shell to another.
setup_shell() {
  echo "Setting up shell"
  # @todo
  echo
}

# Main function, this will be called to install everything
main() {
  umask g-w,o-w

  if [ -t 1 ]; then
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    RESET=$(printf '\033[m')
  else
    RED=""
    GREEN=""
    YELLOW=""
    RESET=""
  fi

  if [ "$PMS_DEBUG" -eq "1" ]; then
    echo "-=[ Debug ]=-"
    echo "PMS:         $PMS"
    echo "PMS_DEBUG:   $PMS_DEBUG"
    echo "PMS_REPO:    $PMS_REPO"
    echo "PMS_REMOTE:  $PMS_REMOTE"
    echo "PMS_BRANCH:  $PMS_BRANCH"
    echo "-=[ Debug ]=-"
  fi

  # @todo validate that git is installed
  # @todo validate that bash, zsh, or other supported shell is installed

  setup_pms
  setup_rcfiles
  setup_shell

  # @todo make this better and more informative for users
  echo "PMS has been installed, please view documentation"

  echo
}

main "$@"
