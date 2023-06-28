#!/bin/sh
wget -O "$BUILD_STAGE_DIR/src/wpa_supplicant.tar.gz" "https://w1.fi/releases/wpa_supplicant-2.10.tar.gz"
mkdir -p "$BUILD_STAGE_DIR/src/wpa_supplicant"
tar -xf "$BUILD_STAGE_DIR/src/wpa_supplicant.tar.gz" -C "$BUILD_STAGE_DIR/src/wpa_supplicant"
cd "$BUILD_STAGE_DIR/src/wpa_supplicant"
make $COMPILER_ARGS
make DESTDIR="$ROOTFS_DIR" install
cd "$OPENORCHID_SRC_DIR"
