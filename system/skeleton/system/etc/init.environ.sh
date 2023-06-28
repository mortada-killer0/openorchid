#!/system/bin/sh

# Environment variables
export SHELL="/system/bin/sh"
export PATH="/sbin:/system/bin:/bin:/system_*/bin:/vendor/bin:/product/bin:/odm/bin:/oem/bin:/system/addon.d"
export COMMAND_PREFIX=""
export TERM="linux"
export PS1="\u@\h:\w$ "
export EDITOR="nano"
export LANG="en_US.UTF-8"
export DISPLAY=":0"
export LD_LIBRARY_PATH="/system/lib:/system/lib32:/system/lib64:/system/libx32:/system_*/lib:/system_*/lib32:/system_*/lib64:/system_*/libx32:/vendor/lib:/vendor/lib32:/vendor/lib64:/vendor/libx32:/product/lib:/product/lib32:/product/lib64:/product/libx32:/odm/lib:/odm/lib32:/odm/lib64:/odm/libx32:/oem/lib:/oem/lib32:/oem/lib64:/oem/libx32"
export TMPDIR="/data/local/tmp:$HOME/.tmp"

# System paths
export SYSTEM_ROOT="/system"
export SYSTEM_DATA="/data"
export SYSTEM_STORAGE="/sdcard"

# Other variables
export WESTON_CURSOR="default"
export B2G_PATH="/system/b2g"
export MOZ_PROFILE="$HOME/.openorchid"
