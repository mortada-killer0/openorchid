#!/system/bin/sh
# Check CPU architecture
if [[ "$(uname -m)" != "i686" && "$(uname -m)" != "x86_64" ]]; then
  echo "This script only supports i686 or x86_64 CPU devices."
  exit 1
fi
# Check if swapfile already exists
if [[ -f /swapfile ]]; then
  echo "Swapfile already exists at /swapfile."
  exit 0
fi
# Determine swapfile size
total_ram=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
swap_size=$((total_ram / 2))
# Create swapfile
dd if=/dev/zero of=/swapfile bs=1M count=$swap_size
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
# Add swapfile to fstab so it persists across reboots
echo "/swapfile none swap sw 0 0" >> /system/etc/patch_hw/fstab.patch_hw
echo "Swapfile created at /swapfile with size ${swap_size}MB."
exit 0
