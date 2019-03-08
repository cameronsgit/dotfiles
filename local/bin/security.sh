#!/usr/bin/env bash

function read-password() {
    security find-generic-password -l "$1" -w
}
