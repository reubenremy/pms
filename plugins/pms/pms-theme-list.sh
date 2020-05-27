# pms theme list
echo
echo "Core Themes:"
for theme in $PMS/themes/*; do
  theme=${theme%*/}
  echo "  ${theme##*/}"
done
echo
echo "Local Themes:"
for theme in $PMS_LOCAL/themes/*; do
  theme=${theme%*/}
  echo "  ${theme##*/}"
done
echo
echo "Current Theme: $PMS_THEME"
echo