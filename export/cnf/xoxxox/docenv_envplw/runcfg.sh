#!/bin/bash

cntprj="${1}"

export PLAYWRIGHT_BROWSERS_PATH=${cntprj}/firefox
cd ${cntprj} &&
npm init -y && \
npm install playwright && \
npx playwright install --with-deps firefox
