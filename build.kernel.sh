#!/bin/sh
if [ ! -e "$KERNEL_SRC_DIR" ]; then
  wget -O "$OPENORCHID_SRC_DIR/linux-5.15.119.tar.xz" "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.119.tar.xz"
  mkdir -p "$KERNEL_SRC_DIR"
  tar -xf "$OPENORCHID_SRC_DIR/linux-5.15.119.tar.xz" -C "$KERNEL_SRC_DIR"
fi
cp -f "$OPENORCHID_SRC_DIR/build/kernel.config" "$KERNEL_SRC_DIR/.config"
cd "$KERNEL_SRC_DIR"
make $COMPILER_ARGS
cp "$KERNEL_SRC_DIR/arch/x86/boot/bzImage" "$ROOTFS_DIR/vmlinuz"
cd "$OPENORCHID_SRC_DIR"
