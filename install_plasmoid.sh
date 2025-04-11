#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

PLASMOID_DIR="$HOME/.local/share/plasma/plasmoids/kde.feveal.meteo"

echo "[Installer] Creating plasmoid directory at: $PLASMOID_DIR"
if mkdir -p "$PLASMOID_DIR"; then
    echo "[Installer] Directory created successfully."
else
    echo "[Error] Failed to create the plasmoid directory." >&2
    exit 1
fi

echo "[Installer] Copying files..."
if cp -r ./* "$PLASMOID_DIR/"; then
    echo "[Installer] Files copied successfully."
    echo "[Installer] ✅ Installation complete. The plasmoid should now appear in your widgets list."
else
    echo "[Error] ❌ Failed to copy files to the plasmoids directory." >&2
    exit 2
fi

