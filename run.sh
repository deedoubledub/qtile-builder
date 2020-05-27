#!/bin/bash

docker run \
  -v $(pwd)/build:/build \
  qtile_builder
