#!/bin/bash
set -euo pipefail

APPINSTALLER_URL="https://desktop.splice.com/conveyor/stable/splice.appinstaller"
EXTRACT_DIR="splice"

MSIX_URL=$(curl -s "$APPINSTALLER_URL" | grep -oP 'Uri="https://[^"]+\.msix"' | head -1 | grep -oP 'https://[^"]+')
MSIX_FILE=$(basename "$MSIX_URL")

wget "$MSIX_URL" -O "$MSIX_FILE"
unzip "$MSIX_FILE" -d "$EXTRACT_DIR"
rm "$MSIX_FILE"

EXE="$PWD/$EXTRACT_DIR/Splice.exe"
echo "Success! Run splice with: wine \"$EXE\""
