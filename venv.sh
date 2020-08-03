#!/bin/bash
venv_path=$DIR/scada.js/nodeenv
if [[ ! -d $venv_path ]] && [[ -n $SCADAJS_1_ENV ]]; then
    venv_path=$SCADAJS_1_ENV
fi
[[ -z $sname ]] && { echo "Session name is empty"; exit 1; }
[[ -z $venv_path ]] && { echo "VIRTUAL_ENV path is empty"; exit 1; }
tmux_set_venv $sname $venv_path
