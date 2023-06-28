#!/system/bin/sh

mkdir -p /data/local
chmod -R 777 /data/local

umask 0027
export TMPDIR=/data/local/tmp
mkdir -p $TMPDIR
chmod 1777 $TMPDIR
ulimit -n 8192

if [ ! -d /system/b2g ]; then
  log -p W "No /system/b2g directory. Restart to recover B2G."
fi

if [ -z "$B2G_DIR" ]; then
  B2G_DIR="/system/b2g"
fi

LD_PRELOAD="$B2G_DIR/libmozglue.so"
if [ -f "$B2G_DIR/libdmd.so" ]; then
  echo "Running with DMD."
  LD_PRELOAD="$B2G_DIR/libdmd.so $LD_PRELOAD"
  export DMD="1"
fi
export LD_PRELOAD

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$B2G_DIR"
export GRE_HOME="$B2G_DIR"

# Run in jar logging mode if needed.
JAR_LOG_ENABLED=`getprop moz.jar.log`
if [ "$JAR_LOG_ENABLED" = "1" ]; then
  export MOZ_JAR_LOG_FILE=/data/local/tmp/jarloader.log
fi

chmod 755 "$B2G_DIR/b2g"
chmod 755 /system/b2ghald/b2ghald
chmod 755 /system/openorchid/api-daemon
chmod -R 755 /system/etc/dhcpcd/

exec $COMMAND_PREFIX "$B2G_DIR/b2g"
