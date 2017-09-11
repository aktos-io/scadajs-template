#!/bin/bash 
DIR=$(dirname "$(readlink -f "$0")")

$DIR/pull.sh
cd scada.js
./update.sh
./install-modules.sh
gulp --webapp pug-ls --production
