#!/usr/bin/env bash

if [[ "${#}" -gt 0 && "$1" != "test" ]]; then
    echo "Only supported option is 'test'"
    exit 0
fi

npm ci

MOCHA_FLAGS=()

echo "TEAMCITY_GIT_PATH=${TEAMCITY_GIT_PATH}"

if [[ -v TEAMCITY_GIT_PATH ]]; then
  # MOCHA_FLAGS+=(--reporter "$(dirname "$0")/tools/mocha-teamcity-reporter/teamcity.cjs")
  MOCHA_FLAGS+=(--reporter "$(dirname "$0")/tools/mocha-teamcity-reporter/teamcity.cjs" --reporter-options parentFlowId="unit_tests")
  echo "##teamcity[flowStarted flowId='unit_tests']"
fi

npx mocha "${MOCHA_FLAGS[@]}" src/hello-world.tests.js

if [[ -v TEAMCITY_GIT_PATH ]]; then
  echo "##teamcity[flowFinished flowId='unit_tests']"
fi
