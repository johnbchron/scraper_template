#!/bin/bash

PROJECT_NAME=$(basename `pwd`)

mkdir -p data

docker build . -t "$PROJECT_NAME" &&

echo "
" &&

docker run \
  --rm \
  --name "$PROJECT_NAME" \
  --mount type=bind,source="$(pwd)"/data,target=/app/data \
  --network=host \
  "$PROJECT_NAME"
