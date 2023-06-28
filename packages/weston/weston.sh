#!/bin/sh
DESTDIR="$ROOTFS_DIR"
git clone https://gitlab.freedesktop.org/wayland/weston.git --depth 1 "$BUILD_STAGE_DIR/src/weston"
cd "$BUILD_STAGE_DIR/src/weston"
meson build/ --prefix="$ROOTFS_DIR"
ninja -C build/ install
cd "$OPENORCHID_SRC_DIR"
