#!/system/bin/sh

# Check if api-daemon binary exists
if [ ! -e /system/adpi/api-daemon ]; then
  echo "api-daemon binary not found. Please install api-daemon."
  exit 1
fi

# Check if dumpmonitor binary exists
if [ ! -e /system/bin/dumpmonitor ]; then
  echo "dumpmonitor binary not found. Please install dumpmonitor."
  exit 1
fi

# Check if weston-launch binary exists
if ! command -v weston-launch >/dev/null 2>&1; then
  echo "weston-launch binary not found. Please install weston-launch."
  exit 1
fi

# Check if b2g binary exists
if [ ! -e /system/bin/b2g.sh ]; then
  echo "b2g binary not found. Please install b2g."
  exit 1
fi

echo "Starting API daemon service..."

# Execute the API daemon program with a specified profile
exec $COMMAND_PREFIX /system/openorchid/api-daemon \
  /system/adpi/config.toml >> /data/logger/api_daemon.log 2>&1 &

echo "Starting shell service..."

# Get the number of monitors and resolutions
monitors_and_resolution=$(exec $COMMAND_PREFIX \
  /system/bin/dumpmonitor)

# Extract the number of monitors and resolutions
num_monitors=$(echo "$monitors_and_resolution" | awk '{print $1}')
resolution=$(echo "$monitors_and_resolution" | awk '{print $2}')

# Calculate the total width and height of the GUI
width=$(echo "$resolution" | awk -F 'x' '{print $1 * '$num_monitors'}')
height=$(echo "$resolution" | awk -F 'x' '{print $2}')

# Change wayland cursor theme
XCURSOR_THEME=$(getprop video.cursor-theme "default")

echo "Starting System UI"

# Get the TTY device file for the current session
tty_device=$(tty)

# Launch the custom GUI application with the calculated width and
# height on the current TTY
weston-launch --config=/system/etc/desktop_config.ini \
  --tty="$tty_device" --user=weston --backend=drm-backend.so \
  --use-gbm --use-gl-renderer --width="$width" --height="$height" \
  -- weston-fullscreen &

# Execute system user interface program
exec $COMMAND_PREFIX /system/bin/b2g.sh &
