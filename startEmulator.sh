#!/bin/bash

DEVICE=$1
echo "my device is ${DEVICE}"

if [ -z $ANDROID_HOME ]; then
    ANDROID_HOME='/opt/android-sdk-linux'
fi

if [ -z $DEVICE ]; then
    DEVICE='Nexus5'
fi

DEVICEOUTPUT="$(${ANDROID_HOME}/platform-tools/adb devices | grep emulator)"

if [ -z "${DEVICEOUTPUT}" ]; then
	echo "${DEVICEOUTPUT}"
    echo "Devices are not found, starting emulator $DEVICE"

    $ANDROID_HOME/tools/emulator -avd $DEVICE &

    echo "Waiting for device to start..."
    $ANDROID_HOME/platform-tools/adb wait-for-device
fi

echo "Emulator now running"

