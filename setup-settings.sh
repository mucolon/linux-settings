#!/bin/bash

echo
echo "Starting script"
cd ~
cp ~/linux-settings/git-prompt.sh ~/.git-prompt.sh

cat ~/linux-settings/bashrc-append.sh >> ~/.bashrc

bash -l

echo
echo "Done"
