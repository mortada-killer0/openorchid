#!/bin/sh
git clone https://github.com/kaiostech/b2g --depth 1 "$BUILD_STAGE_DIR/src/b2g"
cp "$OPENORCHID_SRC_DIR/packages/b2g/mozconfig" "$BUILD_STAGE_DIR/src/b2g/.config"
cd "$BUILD_STAGE_DIR/src/b2g"
./mach build
cd "$OPENORCHID_SRC_DIR"