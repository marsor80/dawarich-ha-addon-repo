#!/usr/bin/env bash
set -e

OPTIONS_FILE="/data/options.json"

SECRET_KEY_BASE="changeme"

if [ -f "$OPTIONS_FILE" ]; then
  SECRET_KEY_BASE=$(jq -r '.SECRET_KEY_BASE' "$OPTIONS_FILE")
fi

export SECRET_KEY_BASE
export RAILS_ENV=production

echo "Starting Dawarich..."
exec /init
