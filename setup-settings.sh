#!/bin/bash

echo
echo "Starting script"
sudo cp ~/linux-settings/git-prompt.sh ~/.git-prompt.sh

cat ~/linux-settings/bashrc-append.sh >> ~/.bashrc

bash -l

echo
echo "Done"
