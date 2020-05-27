# pms upgrade
_update_pms_files() {
  cp -v $PMS/templates/bashrc ~/.bashrc
}

# @todo make sure this can be done 

_checkpoint="$PWD"
if [[ "$PMS_DEBUG" -eq "1" ]]; then
  echo
  echo "-=[ PMS Debug ]=-"
  echo "PMS:         $PMS"
  echo "PMS_DEBUG:   $PMS_DEBUG"
  echo "PMS_REPO:    $PMS_REPO"
  echo "PMS_REMOTE:  $PMS_REMOTE"
  echo "PMS_BRANCH:  $PMS_BRANCH"
  echo "PMS_THEME:   $PMS_THEME"
  echo "PMS_PLUGINS: ${PMS_PLUGINS[*]}"
  echo "PMS_SHELL:   $PMS_SHELL"
  echo "_checkpoint: $_checkpoint"
  echo "-=[ PMS Debug ]=-"
  echo
fi
cd "$PMS"
echo "Upgrading to latest PMS version"
echo
git pull origin master
echo
echo "Copying files"
echo
_update_pms_files
echo
echo "Upgrade complete"
echo
if [ -z $PMS_SHELL ]; then
  exec $PMS_SHELL
fi
cd "$_checkpoint"