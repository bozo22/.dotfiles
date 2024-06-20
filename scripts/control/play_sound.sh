#!/bin/bash

XDG_RUNTIME_DIR=/run/user/`id -u` aplay -D pulse $HOME/.dotfiles/res/test.wav
