#!/bin/sh

if TITLE=$(mpc current); then
  TITLE=$(echo $TITLE | cut -c1-22)
  echo "${TITLE%%.*}..."
else
  echo "Offline"
fi
