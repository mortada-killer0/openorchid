#!/bin/sh
git clone https://github.com/mirror/busybox --depth 1 "$BUILD_STAGE_DIR/src/busybox"
cp "$OPENORCHID_SRC_DIR/packages/busybox/busybox.config" "$BUILD_STAGE_DIR/src/busybox/.config"
cd "$BUILD_STAGE_DIR/src/busybox"
make $COMPILER_ARGS
make CONFIG_PREFIX="$ROOTFS_DIR" install
cd "$OPENORCHID_SRC_DIR"