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
