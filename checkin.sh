
date +"%Y-%m-%d %H:%M:%S" > $HOME/.config/actualDate

if [ "$1" = "-m" ]; then
  vim $HOME/.config/actualDate
fi
