#!/bin/bash

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

if /usr/bin/systemctl is-active --quiet ollama; then
  sudo /usr/bin/systemctl stop ollama
  notify-send -u normal -t 3000 "🧠 Ollama AI" "Service Stopped. GPU freed."
  pkill -RTMIN+8 waybar # Tells Waybar to instantly refresh the icon
else
  sudo /usr/bin/systemctl start ollama
  notify-send -u normal -t 3000 "🧠 Ollama AI" "Service Started. Ready to code."
  pkill -RTMIN+8 waybar # Tells Waybar to instantly refresh the icon
fi
