#!/bin/bash
set -xe
bash bin/install
bash bin/ci/generate_pizza_builder
bash bin/ci/package
bash bin/ci/serverless_generation
bash bin/ci/serverless_production
rspec spec/unit
USE_HECKS_GEMS=true rspec spec/integration
