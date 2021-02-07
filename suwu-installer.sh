#!/bin/bash
if [ -f "/usr/bin/suwu" ]; then
  echo -n "delete suwu? (y/N): "
  read pos
  if [ "$pos" == "y" ]; then
    echo "uninstalling suwu..."
    sudo rm -f /usr/bin/suwu
    if [ -f "/usr/bin/suwu" ]; then
      echo "somehow, someway, suwu is too powerful"
      echo "try again PLEASE"
      exit 1
    fi
    exit 0
  else
    exit 1
  fi
fi
echo -n "do you really want suwu? (y/N): "
read pos
if [ "$pos" != "y" ]; then
  exit 1
fi
echo "downloading suwu"
wget https://raw.githubusercontent.com/videotoaster/suwu/master/suwu
if [ -f "suwu" ]; then
  echo "moving to /usr/bin"
  sudo mv suwu /usr/bin
  echo "executableifying"
  chmod +x /usr/bin/suwu
  echo "install'd"
else
  echo "You've been spared by an ERROR."
  echo "(script download appears to have failed)"
fi
