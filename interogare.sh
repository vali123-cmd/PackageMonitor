#!/usr/bin/bash

param = "$1"

if [ -z "param" ]; then 
    echo "Nu ati introdus niciun parametru!"
    exit 1
fi

if [ "$param" = "1"]; then 
