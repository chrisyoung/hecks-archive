#!/bin/bash
set -xe
bash bin/ci/build_and_install
bash bin/ci/generate_pizza_builder
bash bin/ci/package
bash bin/ci/serverless_generation
bash bin/ci/serverless_local
bash bin/ci/serverless_production
rspec
