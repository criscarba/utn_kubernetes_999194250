#!/bin/bash

# Pre-Requisitos
# Funcion para intalar 'jq' segun OS
install_jq() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then        
        # Linux (Debian/Ubuntu)
        if command -v apt-get >/dev/null; then
            echo "Instalando jq en Linux (Debian/Ubuntu)..."
            sudo apt-get update && sudo apt-get install -y jq
        # Otras distro Linux (ej. Fedora)
        elif command -v yum >/dev/null; then
            echo "Instalando jq en Linux (Fedora/RHEL)..."
            sudo yum install -y jq
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then        
        # macOS
        echo "Instalando jq en macOS..."
        brew install jq
    elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        # Windows c/ Cygwin o Git Bash
        echo "Instalar jq manualmente en Windows. Link: https://stedolan.github.io/jq/download/"
        exit 1
    else
        echo "OS no soportado. Por favor Instalar 'jq' manualmente."
        exit 1
    fi
}

if ! command -v jq &> /dev/null; then
    echo "'jq' no instalado. Instalando 'jq'..."
    install_jq
else
    echo "'jq' se encuentra instalado."
fi

# Test Case 3 - Request con parametros de tabla inexistente (Tabla 'no_existe')

echo "Realizando GET request hacia localhost:8080/query/no_existe..."

curl -s http://localhost:8080/query/no_existe | jq .