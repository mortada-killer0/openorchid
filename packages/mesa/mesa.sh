#!/bin/sh
DESTDIR="$ROOTFS_DIR"
git clone https://github.com/Mesa3D/mesa --depth 1 "$BUILD_STAGE_DIR/src/mesa"
cd "$BUILD_STAGE_DIR/src/mesa"
meson build/ --prefix="$ROOTFS_DIR"
ninja -C build/ install
cd "$OPENORCHID_SRC_DIR"
