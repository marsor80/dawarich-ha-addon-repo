#!/usr/bin/env bash
set -e

OPTIONS_FILE="/data/options.json"

# Domyślne wartości
DB_PATH="/data/dawarich.sqlite3"
PORT=3000
LOG_LEVEL="info"
SECRET_KEY_BASE=""

if [ -f "$OPTIONS_FILE" ]; then
  echo "Loading options from $OPTIONS_FILE"
  DB_PATH=$(jq -r '.DB_PATH' "$OPTIONS_FILE")
  PORT=$(jq -r '.PORT' "$OPTIONS_FILE")
  LOG_LEVEL=$(jq -r '.LOG_LEVEL' "$OPTIONS_FILE")
  SECRET_KEY_BASE=$(jq -r '.SECRET_KEY_BASE' "$OPTIONS_FILE")
fi

# Eksport zmiennych środowiskowych dla Dawarich
export DAWARICH_DB_PATH="$DB_PATH"
export PORT="$PORT"
export RAILS_LOG_LEVEL="$LOG_LEVEL"
export SECRET_KEY_BASE="$SECRET_KEY_BASE"

# Logowanie aktualnej konfiguracji
echo "Starting Dawarich with config:"
echo "  DB_PATH=$DAWARICH_DB_PATH"
echo "  PORT=$PORT"
echo "  LOG_LEVEL=$RAILS_LOG_LEVEL"
echo "  SECRET_KEY_BASE set: $( [ -n "$SECRET_KEY_BASE" ] && echo yes || echo no )"

# Uruchomienie obrazu
exec /init
