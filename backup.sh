#!/bin/bash

echo "running 'mackup backup'.."
mackup backup
echo "'mackup backup' completed"

echo "backing up /Users/tom/.vim/ .."
if [ -d ~/Dropbox/Mackup/.vim/ ]; then
    echo "A file named /Users/tom/Dropbox/Mackup/.vim already exists in the backup."
    read -p "Are you sure that you want to replace it ? <Yes|No>" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      cp -r ~/.vim ~/Dropbox/Mackup/.vim
      rm -rf ~/.vim
      ln -s ~/Dropbox/Mackup/.vim ~/.vim
    fi
fi

exit
