#!/usr/bin/env bash

# ----------------------------------------
# Configura e monta o Google Drive via Rclone
# Compatível com qualquer Linux
# ----------------------------------------

set -e

REMOTE_NAME="gdrive"
MOUNT_DIR="$HOME/GDrive"

# Detecta navegador padrão
detect_browser() {
    for b in xdg-open sensible-browser gnome-open kde-open firefox chromium google-chrome brave vivaldi; do
        if command -v "$b" >/dev/null 2>&1; then
            echo "$b"
            return
        fi
    done
}

# Detecta gerenciador de arquivos
detect_file_manager() {
    for fm in xdg-open nautilus dolphin thunar pcmanfm nemo caja; do
        if command -v "$fm" >/dev/null 2>&1; then
            echo "$fm"
            return
        fi
    done
}

# Verifica se o rclone está instalado
if ! command -v rclone >/dev/null 2>&1; then
    echo "❌ O Rclone não está instalado."
    echo ""
    echo "👉 Instale o Rclone antes de continuar:"
    echo "   • Debian/Ubuntu:   sudo apt install rclone"
    echo "   • Fedora/DNF:      sudo dnf install rclone"
    echo "   • Arch/Manjaro:    sudo pacman -S rclone"
    echo "   • Ou baixe direto: https://rclone.org/downloads/"
    echo ""
    exit 1
fi

# Cria pasta de montagem
mkdir -p "$MOUNT_DIR"

# Se o remote não existir, abre o menu interativo
if ! rclone listremotes | grep -q "^${REMOTE_NAME}:"; then
    echo "🔧 Nenhuma configuração do Google Drive encontrada."
    echo "👉 O Rclone abrirá o menu de configuração agora."
    sleep 2
    BROWSER_CMD=$(detect_browser)
    export BROWSER="$BROWSER_CMD"
    rclone config
fi

# Testa se o token está válido (tenta listar a raiz do drive)
echo "🔎 Verificando conexão com o Google Drive..."
if ! rclone lsd "${REMOTE_NAME}:" >/dev/null 2>&1; then
    echo "⚠️ Token inválido ou expirado. Reautenticando..."
    BROWSER_CMD=$(detect_browser)
    export BROWSER="$BROWSER_CMD"
    rclone config reconnect "${REMOTE_NAME}:" || {
        echo "❌ Falha ao reconectar. Execute manualmente: rclone config reconnect ${REMOTE_NAME}:"
        exit 1
    }
    echo "✅ Reautenticação concluída!"
fi

# Monta o drive em segundo plano
echo "🔗 Montando Google Drive em: $MOUNT_DIR ..."
rclone mount "$REMOTE_NAME": "$MOUNT_DIR" --daemon
sleep 2

# Abre o gerenciador de arquivos
FILE_MANAGER=$(detect_file_manager)
if [ -n "$FILE_MANAGER" ]; then
    echo "📂 Abrindo $MOUNT_DIR no gerenciador de arquivos..."
    nohup "$FILE_MANAGER" "$MOUNT_DIR" >/dev/null 2>&1 &
else
    echo "⚠️ Nenhum gerenciador de arquivos detectado. Use:"
    echo "   xdg-open \"$MOUNT_DIR\""
fi

echo "✅ Google Drive montado com sucesso em $MOUNT_DIR"
