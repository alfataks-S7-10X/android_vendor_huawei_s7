#!/system/bin/sh
#
#
#
#
#
target=`getprop ro.board.platform`
case "$target" in
    # QSD8x50: IDEOS S7, Inc
    "qsd8k")
        # /system/lib/libqct-opt JNI native will write
        # mfreq to set CPU freq to max for performance
        chown root.system /sys/devices/system/cpu/mfreq
        chmod 220 /sys/devices/system/cpu/mfreq
        # Configure and enable KSM
        echo 1000 > /sys/kernel/mm/ksm/sleep_millisecs
        echo 100 > /sys/kernel/mm/ksm/pages_to_scan
        echo 1 > /sys/kernel/mm/ksm/run
    ;;
esac
