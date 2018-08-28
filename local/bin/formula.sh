#!/bin/sh
brew deps --installed | awk -E ./filter.awk
