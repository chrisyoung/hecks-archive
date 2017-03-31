#!/bin/bash
bash bin/ci/build_and_install
bash bin/ci/generate_pizza_builder
bash bin/ci/package_binary
bash bin/ci/package_lambda
