#!/usr/bin/env bash
brew deps --installed | awk -E "$(dirname "$0")/filter.awk"
