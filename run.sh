#!/bin/bash

docker run \
  -v $(pwd)/build:/build \
  -v $(pwd)/release:/release \
  qtile_builder
