#!/bin/bash

ln -s /home/emacs/.emacs.d -rt $UHOME
ln -s $UHOME/env_setup/spacemacs.d -r $UHOME/.spacemacs.d
ln -s $UHOME/env_setup/tmux.conf -r $UHOME/.tmux.conf
ln -s env_setup/.bash_profile -rt $UHOME
ln -s env_setup/.bashrc -rt $UHOME
ln -s env_setup/pep8 -rt $UHOME/.config
ln -s env_setup/powerline -rt $UHOME/.config
ln -s env_setup/pylintrc -rt $UHOME/.config

asEnvUser "$@"
