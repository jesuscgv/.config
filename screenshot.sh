#!/bin/bash

# Función para capturar toda la pantalla y copiar al portapapeles
capture_full() {
    grim - | wl-copy --type image/png
    notify-send "Captura de pantalla" "Pantalla completa copiada al portapapeles"
}

# Función para capturar una región seleccionada y copiar al portapapeles
capture_selection() {
    REGION=$(slurp)
    if [ -z "$REGION" ]; then
        notify-send "Captura de pantalla" "Selección cancelada"
        exit 1
    fi
    grim -g "$REGION" - | wl-copy --type image/png
    notify-send "Captura de pantalla" "Región seleccionada copiada al portapapeles"
}

# Verificar el argumento
case "$1" in
    p)
        capture_full
        ;;
    s)
        capture_selection
        ;;
    *)
        echo "Uso: $0 {p|s}"
        echo "  p: Capturar toda la pantalla y copiar al portapapeles"
        echo "  s: Capturar una región seleccionada y copiar al portapapeles"
        exit 1
        ;;
esac

