#!/usr/bin/env bash
#
# setup-bridge.sh
# Creates and enables the Linux bridge used as the central switch
# for the 10-client Containerlab topology.
#
# Usage:
#   chmod +x setup-bridge.sh
#   ./setup-bridge.sh
#
# Idempotent: safe to run multiple times.

set -euo pipefail

BRIDGE_NAME="${BRIDGE_NAME:-br-clab}"

# Require root (or run via sudo)
if [[ $EUID -ne 0 ]]; then
    echo "This script needs root privileges. Re-running with sudo..."
    exec sudo --preserve-env=BRIDGE_NAME "$0" "$@"
fi

# Create the bridge if it does not already exist
if ip link show "$BRIDGE_NAME" &>/dev/null; then
    echo "[i] Bridge '$BRIDGE_NAME' already exists — skipping creation."
else
    echo "[+] Creating bridge '$BRIDGE_NAME'..."
    ip link add name "$BRIDGE_NAME" type bridge
fi

# Bring the bridge up
echo "[+] Bringing '$BRIDGE_NAME' up..."
ip link set dev "$BRIDGE_NAME" up

# Show the result
echo
echo "[✓] Bridge ready:"
ip -brief addr show "$BRIDGE_NAME"

chmod +x setup-bridge.sh

#./setup-bridge.sh
# or
BRIDGE_NAME=my-bridge ./setup-bridge.sh