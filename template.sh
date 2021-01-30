#!/bin/bash

for release in $(find releases/ -name "*.yaml"); do
    # getting just the name of the release
    release_name=$(cat $release | grep "name: " | cut -d' ' -f2-)

    if grep -E "$release_name" helmfile.yaml >> /dev/null ; then
      echo "Skipping $release_name"
    else
      echo "Templating $release_name"

      cat $release >> helmfile.yaml
      echo ""  >> helmfile.yaml
    fi

done


