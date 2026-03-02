#!/usr/bin/env bash

# Percorso del tuo profilo calibrato
ICC_PROFILE="$HOME/.local/share/icc/macbook_retina.icc"
# Valore ottimale che abbiamo scelto
TEMP=4200

if [[ $1 = "toggle" ]]; then
    if pgrep -x "gammastep" > /dev/null; then
        # 1. Spegni il filtro
        pkill -x "gammastep"
        # 2. RIPRISTINA subito il profilo ICC (fondamentale!)
        dispwin -L "$ICC_PROFILE" 2>/dev/null || dispwin "$ICC_PROFILE" 2>/dev/null
    else
        # Attiva il filtro al valore ottimale
        gammastep -O $TEMP 2>/dev/null &
    fi
fi

# Icone per il pannello
if pgrep -x "gammastep" > /dev/null; then
    echo " "
else
    echo ""
fi
