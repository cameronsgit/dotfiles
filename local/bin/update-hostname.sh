#!/bin/bash
readonly computerName="sowderca-macOS"
sudo scutil --set ComputerName "$computerName"
sudo scutil --set LocalHostName "$computerName"
dscacheutil -flushcache
