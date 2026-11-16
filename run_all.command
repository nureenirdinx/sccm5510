#!/usr/bin/env bash
# run_all.command — server + Alice + Bob, each in its own Terminal window.
set -e
cd "$(dirname "$0")"          # run from the script's own directory
PORT=8443

osascript <<EOF
tell application "Terminal"
    activate
    do script "cd \"$(pwd)\" && python3 messaging_server.py --port $PORT"
    delay 2
    do script "cd \"$(pwd)\" && python3 messaging_client.py --state alice.json --name alice --port $PORT"
    do script "cd \"$(pwd)\" && python3 messaging_client.py --state bob.json   --name bob   --port $PORT"
end tell
EOF

echo "Launched server + Alice + Bob in three Terminal windows."