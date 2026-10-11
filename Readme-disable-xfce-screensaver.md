# Disable XFCE Screensaver & Display Power Management (Kali Linux 2026)

This script force-disables all XFCE screensaver, screen locking, DPMS, and display
power-management features on **Kali Linux 2026 (XFCE edition)**.

It directly modifies the correct `xfconf` keys used by the XFCE Power Manager and
XFCE Screensaver, ensuring that:

- Screensaver is fully disabled  
- Lock screen is disabled  
- Display blanking is disabled  
- DPMS sleep/off timers are disabled  
- Suspend/hibernate lock is disabled  
- X11 screen blanking is disabled  
- Light-locker is terminated if running  

This is useful for live USB environments, kiosk setups, long-running tasks,
or systems where screen blanking and locking must not occur.

---

## Features

- Disables XFCE screensaver  
- Disables XFCE lock screen  
- Disables DPMS (sleep/off timers)  
- Sets blank-on-AC and blank-on-battery to 0  
- Prevents lock-on-suspend  
- Applies X11 `xset` no-blank settings  
- Kills `xfce4-screensaver` and `light-locker` if active  

---

## Usage

1. Download or copy the script to your system:

   ```bash
   chmod +x disable-xfce-screensaver.sh
   ```

### Run it:   

./disable-xfce-screensaver.sh   

### Verify settings:   

xfconf-query -c xfce4-power-manager -lv
xfconf-query -c xfce4-screensaver -lv   

```
/xfce4-power-manager/blank-on-ac                    0
/xfce4-power-manager/blank-on-battery               0
/xfce4-power-manager/dpms-enabled                   false
/xfce4-power-manager/dpms-off-time                  0
/xfce4-power-manager/dpms-sleep-time                0
/xfce4-power-manager/lock-screen-suspend-hibernate  false
/xfce4-power-manager/power-button-action            3
/xfce4-power-manager/show-panel-label               0
/xfce4-power-manager/show-tray-icon                 false
/lock/embedded-keyboard/command  onboard -e
/lock/embedded-keyboard/enabled  false
/lock/enabled                    false
/lock/sleep-activation           false
/saver/enabled                   false
/saver/mode                      blank
```
