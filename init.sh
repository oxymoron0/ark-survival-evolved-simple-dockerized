#!/bin/bash
set -e

ARKMANAGER="/home/steam/bin/arkmanager"
ARK_DIR="/home/steam/ARK"

# 1. ARK가 설치되지 않은 경우 install
if [ ! -d "$ARK_DIR/ShooterGame/Binaries/Linux" ]; then
    echo "[INFO] ARK not found. Installing..."
    "$ARKMANAGER" install --verbose
fi

if [ $SKIP_UPDATE = false ]; then
    echo "[INFO] Checking for ARK updates..."
    "$ARKMANAGER" update --verbose
else
    echo "[INFO] Update check skipped (--skip-update provided)"
fi

# 3. installmods 실행
if [ $INSTALL_MODS = true ]; then
    echo "[INFO] Installing mods..."
    "$ARKMANAGER" installmods --verbose
fi

# 4. 서버 업로드(시작)
echo "[INFO] Starting ARK server..."
"$ARKMANAGER" run --verbose