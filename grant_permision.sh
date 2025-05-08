#!/bin/bash

# Check if ADB is installed
if ! command -v adb &> /dev/null
then
    echo "ADB is not installed. Please install it using: pkg install android-tools"
    exit 1
fi

# Request Package Name from User
read -p "Enter the Package Name (e.g., com.trbdfspixels): " package

# Check if package is empty
if [ -z "$package" ]; then
    echo "Package name cannot be empty."
    exit 1
fi

# Check if ADB is connected
adb devices | grep -q "device"
if [ $? -ne 0 ]; then
    echo "No device connected. Make sure USB Debugging is enabled and your device is connected."
    exit 1
fi

# Granting Permission
adb shell pm grant $package android.permission.WRITE_SECURE_SETTINGS

# Success Message
echo "Permission granted successfully for $package"
