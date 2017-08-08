#!/bin/bash
printf "\e[32m Switching directories...\e[0m \n"
pushd /Users/sowderca/Devwork/VC3

printf "\e[32m Updating git repos...\e[0m \n"
printf "\e[32m =================================== \e[0m \n"
ls | xargs -P10 -I{} git -C {} pull

printf "\e[32m Switching back...\e[0m \n"
popd

printf "\e[32m Done! \e[0m \n"
