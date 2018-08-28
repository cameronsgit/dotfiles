#!/bin/bash

# -*- mode: sh -*-
# vi: set ft=sh :

printf "\e[32m Switching directories...\e[0m \n"
pushd $HOME/Development
printf "\e[32m Updating git reposititories...\e[0m \n"
ls | xargs -P 10 -I {} git -C {} pull origin master
printf "\e[32m Switching back...\e[0m \n"
popd
printf "\e[32m Done! \e[0m \n"
