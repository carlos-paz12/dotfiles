#!/bin/bash

echo -e "[  --  ] Instalando extensões...\n"

while IFS= read -r extension; do
  codium --install-extension "$extension"
done < "$(dirname "$0")/extensions.txt"

echo -e "[  OK  ] Todas as extensões instaladas.\n"
