#!/bin/bash

if /usr/bin/systemctl is-active --quiet ollama; then
  # Sends the "active" state to Waybar
  echo '{"alt": "active", "class": "active", "tooltip": "Ollama is RUNNING"}'
else
  # Sends the "inactive" state to Waybar
  echo '{"alt": "inactive", "class": "inactive", "tooltip": "Ollama is STOPPED"}'
fi
