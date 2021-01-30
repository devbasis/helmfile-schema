#!/bin/bash

source ./template.sh

if [[ -z $Environment ]]; then
  echo "[ERROR] Environment is required"
  exit
fi

helmfile -e ${Environment} apply