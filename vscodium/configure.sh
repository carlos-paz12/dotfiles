#!/bin/bash

echo "[+] Instalando extensões..."

while IFS= read -r extension; do
  codium --install-extension "$extension"
done < "$(dirname "$0")/extensions.txt"

echo "[✓] Todas as extensões instaladas."
