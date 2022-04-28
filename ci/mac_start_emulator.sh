#!/bin/bash

set -e

echo "y" | $ANDROID_HOME/tools/bin/sdkmanager --install 'system-images;android-29;google_apis;arm64-v8a' --channel=3
echo "no" | $ANDROID_HOME/tools/bin/avdmanager create avd -n test_android_emulator -k 'system-images;android-29;google_apis;arm64-v8a' --force
ls $ANDROID_HOME/tools/bin/
nohup $ANDROID_HOME/emulator/emulator -partition-size 2048 -avd test_android_emulator -no-snapshot > /dev/null 2>&1 & $ANDROID_HOME/platform-tools/adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed | tr -d '\r') ]]; do sleep 1; done; input keyevent 82'
