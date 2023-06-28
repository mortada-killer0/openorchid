#!/system/bin/sh

# Enable ACPI wake-up events
echo "PWRB PBTN LID" > /proc/acpi/wakeup

# End of script
exit 0
