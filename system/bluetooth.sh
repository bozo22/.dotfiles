#!/usr/bin/env bash

device="D4:6D:6D:FC:CA:50"

if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
  bluetoothctl power off
else
  bluetoothctl power on
fi
