#!/system/bin/sh

# Configure the USB gadget
modprobe libcomposite
cd /sys/kernel/config/usb_gadget/
mkdir -p g1
cd g1

# Set the gadget vendor and product IDs
echo 0x1234 > idVendor
echo 0x5678 > idProduct

# Get the serial number
serial=$(cat /proc/cpuinfo | grep Serial | awk '{print $3}')

# Get the manufacturer name
manufacturer=$(cat /sys/class/dmi/id/sys_vendor)

# Get the product name
product=$(cat /sys/class/dmi/id/product_name)

# Populate the gadget strings
echo "$serial" > strings/0x409/serialnumber
echo "$manufacturer" > strings/0x409/manufacturer
echo "$product" > strings/0x409/product

# Enable USB mass storage function
mkdir -p functions/mass_storage.0
echo 1 > functions/mass_storage.0/stall
echo 0 > functions/mass_storage.0/lun.0/removable
echo 0 > functions/mass_storage.0/lun.0/ro
echo "/sdcard" > functions/mass_storage.0/lun.0/file
echo 512 > functions/mass_storage.0/lun.0/cdrom
echo 0 > functions/mass_storage.0/lun.0/nofua

# Enable second USB mass storage function
mkdir -p functions/mass_storage.1
echo 1 > functions/mass_storage.1/stall
echo 1 > functions/mass_storage.1/lun.0/removable
echo 1 > functions/mass_storage.1/lun.0/ro
echo "/system/etc/adb.iso" > functions/mass_storage.1/lun.0/file
echo 512 > functions/mass_storage.1/lun.0/cdrom
echo 0 > functions/mass_storage.1/lun.0/nofua

# Set the configuration
mkdir -p configs/c.1
ln -s functions/mass_storage.0 configs/c.1/
ln -s functions/mass_storage.1 configs/c.1/
echo 250 > configs/c.1/MaxPower

# Enable the gadget
ls /sys/class/udc > UDC
