#!/bin/bash
source /root/config/android-build-vars.sh 

cd /root/android

repo init -u $REPO -b $BRANCH
repo sync -f

# Uncomment for Cyanogenmod
# vendor/cm/get-prebuilts

source build/envsetup.sh

if [ -z "$DEVICE" ]; then
  $BRLUNCH
else
  DEVICE_LC=$(echo $DEVICE | tr '[A-Z]' '[a-z]')
  $BRLUNCH $DEVICE
fi

$MAKE

