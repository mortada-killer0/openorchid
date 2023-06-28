#!/bin/sh
git clone https://github.com/kaiostech/api-daemon --depth 1 "$BUILD_STAGE_DIR/src/api-daemon"
cd "$BUILD_STAGE_DIR/src/api-daemon"
make $COMPILER_ARGS
make CONFIG_PREFIX="$ROOTFS_DIR" install
cd "$OPENORCHID_SRC_DIR"