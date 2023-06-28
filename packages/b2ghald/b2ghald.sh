#!/bin/sh
git clone https://github.com/capyloon/b2ghald --depth 1 "$BUILD_STAGE_DIR/src/b2ghald"
cd "$BUILD_STAGE_DIR/src/b2ghald"
make $COMPILER_ARGS
make CONFIG_PREFIX="$ROOTFS_DIR" install
cd "$OPENORCHID_SRC_DIR"