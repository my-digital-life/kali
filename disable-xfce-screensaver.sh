#!/bin/bash

echo "[1/8] Disable lock on suspend/hibernate (power manager)..."
xfconf-query -c xfce4-power-manager \
  -p /xfce4-power-manager/lock-screen-suspend-hibernate \
  --create -t bool -s false

echo "[2/8] Disable display blanking (AC/battery)..."
xfconf-query -c xfce4-power-manager \
  -p /xfce4-power-manager/blank-on-ac \
  --create -t int -s 0
xfconf-query -c xfce4-power-manager \
  -p /xfce4-power-manager/blank-on-battery \
  --create -t int -s 0

echo "[3/8] Disable DPMS + timers..."
xfconf-query -c xfce4-power-manager \
  -p /xfce4-power-manager/dpms-enabled \
  --create -t bool -s false
xfconf-query -c xfce4-power-manager \
  -p /xfce4-power-manager/dpms-sleep-time \
  --create -t int -s 0
xfconf-query -c xfce4-power-manager \
  -p /xfce4-power-manager/dpms-off-time \
  --create -t int -s 0

echo "[4/8] Disable XFCE screensaver + lock..."
xfconf-query -c xfce4-screensaver \
  -p /saver/enabled \
  --create -t bool -s false
xfconf-query -c xfce4-screensaver \
  -p /lock/enabled \
  --create -t bool -s false

echo "[5/8] Force saver mode to 'blank' (no fancy saver)..."
xfconf-query -c xfce4-screensaver \
  -p /saver/mode \
  --create -t string -s blank

echo "[6/8] Disable embedded keyboard on lock (just in case)..."
xfconf-query -c xfce4-screensaver \
  -p /lock/embedded-keyboard/enabled \
  --create -t bool -s false

echo "[7/8] Kill screensaver/locker daemons..."
pkill -x xfce4-screensaver 2>/dev/null
pkill -x light-locker 2>/dev/null

echo "[8/8] Apply X11 no-blank / no-DPMS..."
xset s off
xset -dpms
xset s noblank

echo "✔ XFCE power-manager + screensaver + lock + DPMS forced disabled."
