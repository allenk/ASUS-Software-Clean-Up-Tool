# deepclean.cmd

**ASUS Software Clean Up Tool** for Windows

> A comprehensive batch script that completely removes ASUS software, drivers, services, and registry entries from Windows systems.

| | |
|---|---|
| **Platform** | Windows 10 / 11 |
| **Language** | Batch (CMD) + PowerShell |
| **Version** | 0.1a |
| **Original Gist** | [allenk/deepclean.cmd](https://gist.github.com/allenk/fcbee909fbf8fb9a54d4484297a1eeba) |

---

## Why This Tool Exists

ASUS ships an extensive software ecosystem with its motherboards, laptops, and peripherals: Armoury Crate, AI Suite, AURA Lighting, ROG services, GameSDK, and dozens of background drivers. These components:

- Run persistent background services and kernel drivers even when unused
- Reinstall themselves through Windows Update and scheduled tasks
- Leave behind deep registry entries, scheduled tasks, and system files after standard uninstallation
- Are notoriously difficult to fully remove using official uninstallers alone

**deepclean.cmd** performs a thorough, multi-phase cleanup that goes far beyond what ASUS's own removal tools accomplish. It was born from community frustration and has been refined through years of real-world feedback.

---

## Features

The script executes **10 cleanup phases**, each targeting a different layer of ASUS software presence:

| Phase | Description |
|-------|-------------|
| **0** | Uninstall applications via their setup programs and PowerShell `Remove-AppPackage` |
| **1** | Backup and delete folders from Program Files, ProgramData, and user profiles |
| **2** | Remove specific system files (DLLs, executables, drivers) from System32 |
| **3** | Registry cleanup pass 1 — services, HKLM, HKCU, HKCR keys |
| **4** | Registry cleanup pass 2 — WOW6432Node, uninstall entries, class registrations |
| **5** | Remove Windows scheduled tasks (ASUS folder and named tasks) |
| **6** | Remove Armoury Crate UWP app (second pass) |
| **7** | Remove all remaining ASUS UWP/AppX packages (with user confirmation) |
| **8** | Clean up stubborn system profile folders with forced permissions |
| **9** | Clear temporary files |

### Components Removed

- **Armoury Crate** and all related services (Lite Service, Control Interface, Socket Server)
- **AURA Lighting** — Motherboard HAL, DRAM Component, Extension Card HAL, SDK
- **ROG Software** — FAN XPERT 4, Live Service, RYUO III, Font Installers
- **AI Suite 3** and ASUS Framework
- **GameSDK Service**
- **ASUS Driver Hub**
- **Kernel Drivers** — AsIO2, AsIO3, IOMap64, asusgio2, asusgio3
- **Services** — 20+ ASUS services stopped and deleted
- **Registry** — Hundreds of registry keys across HKLM, HKCU, HKCR, WOW6432Node
- **Scheduled Tasks** — All tasks under the `\ASUS\` scheduler folder
- **Notebook/Laptop drivers** — ASUS System Control Interface (with safety caveats)

---

## Prerequisites

**Complete these steps before running deepclean.cmd:**

1. **Back up your system** completely (create a system image or restore point)
2. **Disable ASUS apps in BIOS** — turn off MyASUS and Armoury Crate in UEFI settings to prevent reinstallation
3. **Run ASUS official removal tools** first (Armoury Crate Uninstall Tool, geek_uninstall.exe)
4. **Remove all ASUS applications** through their own uninstallers (AI Suite, ASUS IME, etc.)
5. **Reboot** your system
6. **Run deepclean.cmd as Administrator**
7. **Reboot** again after completion
8. Optionally, **run the tool again** — it is designed to be run repeatedly for thorough cleanup

---

## Usage

```batch
:: Right-click deepclean.cmd and select "Run as administrator"
:: Or from an elevated Command Prompt:
.\src\deepclean.cmd
```

The script will:
1. Ask for confirmation before proceeding
2. Attempt to uninstall applications (some may show setup UI)
3. Stop and delete all ASUS services and kernel drivers
4. Back up and remove folders, files, and registry keys
5. Ask again before removing all ASUS UWP apps (Phase 7)
6. Clean temporary files

---

## Safety & Backup

deepclean.cmd creates a `_backup_` folder in its working directory **before** deleting anything:

```
_backup_/
  folders/          # Full copies of removed directories (via robocopy /MOVE)
  files/            # Backed-up system files (AsIO DLLs, drivers, etc.)
    drivers/        # Driver files (AsIO2.sys, AsIO3.sys, IOMap64.sys)
    SysWOW64/       # 32-bit system DLLs
  registry/         # Exported .reg files for every deleted registry key
  cleanfolders_*.log  # Robocopy operation logs
```

Files that cannot be deleted immediately are registered for deletion on next reboot via `MoveFileEx` with `MOVEFILE_DELAY_UNTIL_REBOOT`.

> **Note**: The backup folder contains raw copies of files and exported registry keys. These are **not** reinstallation packages — to restore ASUS functionality, download fresh drivers from the [ASUS Support website](https://www.asus.com/support/).

---

## Known Issues & Warnings

### HID Input Driver Loss (Laptops)

**Severity: Critical** | Identified: December 2025

On certain ASUS laptop models, the script removes HID remapping drivers (`acsevirtualbus.inf` and `acsehidremap.inf`) which causes **complete loss of keyboard and mouse input**. This affects built-in and external USB input devices.

**Current status**: These drivers are **no longer removed by default** in the latest version. The ASUS System Control Interface driver removal (Phase 0) now uses a targeted query that should avoid these components, but users should be aware of the risk.

**See [Emergency Recovery](#emergency-recovery) below if this happens.**

### ZenBook / Laptop-Specific Services

Some ASUS laptop services are required for hardware functionality:
- `ASUSOptimization` — keyboard backlighting on ZenBook S series
- `AsusNumPadService` — NumberPad (trackpad numpad) functionality

Removing these services will disable the associated hardware features. Consider whether you still need them before running the script.

### Persistent Driver Downloads After Motherboard Swap

If you replaced an ASUS motherboard with a non-ASUS board but Windows keeps downloading ASUS drivers, check:

```
HKEY_LOCAL_MACHINE\SYSTEM\HardwareConfig
```

This key may contain entries from the old ASUS motherboard that trigger driver downloads. Remove the orphaned motherboard configuration entries to stop this behavior.

### Not for Active ASUS Hardware Users

This tool removes **all** ASUS software infrastructure. If you still use ASUS-specific features (AURA RGB lighting, fan curves via AI Suite, Armoury Crate game profiles), do **not** run this script.

---

## Emergency Recovery

### Restoring Keyboard & Mouse (No Input Devices)

If your keyboard and mouse stop working after running deepclean.cmd:

1. **Create a Windows 10/11 bootable USB** on another computer
2. Boot from the USB and select **"Repair your computer"** (not "Install")
3. Navigate to **Troubleshoot > Advanced Options > Command Prompt**
4. Identify your Windows drive letter (it may not be `C:` in WinRE):
   ```
   diskpart
   list volume
   exit
   ```
5. Run DISM to reinstall all drivers recursively:
   ```
   dism /image:C:\ /add-driver /driver:D:\ /recurse
   ```
   (Replace `C:` with your Windows partition and `D:` with the USB/driver source)
6. Reboot and verify input devices are restored

**Root cause**: The drivers `acsevirtualbus.inf` and `acsehidremap.inf` manage HID device mapping on ASUS laptops. Their removal disconnects all input devices from Windows.

---

## Changelog

This project originated as a [GitHub Gist](https://gist.github.com/allenk/fcbee909fbf8fb9a54d4484297a1eeba) with 24 revisions and 74 comments. Key milestones:

### 2025-12 — HID Driver Safety
- Identified critical issue: removing `acsevirtualbus.inf` and `acsehidremap.inf` causes total input device loss on ASUS laptops
- Documented WinRE/DISM recovery procedure
- Policy change: these drivers are no longer removed by default
- Credits: [@mem1991](https://github.com/mem1991), [@CutiePika](https://github.com/CutiePika)

### 2025-10 — Robocopy & UI Improvements
- Fixed alarming (but harmless) System32 deletion messages
- Improved error messaging clarity

### 2025-05 — Kernel Driver Management
- Added `sc stop` and `sc delete` for `asusgio2` and `asusgio3` kernel drivers
- Confirmed these are legacy/non-PnP drivers properly managed via `sc` (not `pnputil`)
- Credit: [@LeadAssimilator](https://github.com/LeadAssimilator)

### 2025-01 — Robocopy Infinite Loop Fix
- Fixed infinite loop where robocopy repeatedly attempted to move `AsIO2.dll`, `AsIO3.dll`, and `AsusDownloadLicense.exe` from System32
- Added `delete_special` function with `takeown` + `icacls` + `MoveFileEx` fallback
- Credit: [@ArasakaApart](https://github.com/ArasakaApart)

### 2024-10 — HardwareConfig Discovery
- Documented `HKLM\SYSTEM\HardwareConfig` as root cause for persistent ASUS driver downloads after motherboard replacement
- Added BIOS disable recommendations to prerequisites
- Credit: [@Acrivec](https://github.com/Acrivec)

### 2024-07 — Context Menu & Registry Expansion
- Added `HKCR\Directory\Background\shell\GameLibrary` removal (Armoury Crate context menu)
- Major expansion of registry cleanup coverage
- Community reported extensive remaining registry entries after standard cleanup

### 2024-04 — Early Community Adoption
- Users confirmed script resolved issues that official ASUS uninstallers couldn't fix
- Identified `FileRepository` as source of persistent ASUS services

### 2023-04 — Initial Release
- First version published as GitHub Gist
- Core multi-phase cleanup structure established

---

## Community Acknowledgments

This tool has been shaped by extensive community feedback. Special thanks to:

| Contributor | Contribution |
|---|---|
| [@Acrivec](https://github.com/Acrivec) | HardwareConfig discovery, registry expansion suggestions |
| [@LeadAssimilator](https://github.com/LeadAssimilator) | asusgio2/asusgio3 kernel driver management |
| [@ArasakaApart](https://github.com/ArasakaApart) | Robocopy infinite loop bug report and testing |
| [@mem1991](https://github.com/mem1991) | HID driver issue identification and recovery testing |
| [@CutiePika](https://github.com/CutiePika) | HID driver issue initial report |
| [@belst-n](https://github.com/belst-n) | ZenBook service dependency documentation |
| [@bolieriniefu](https://github.com/bolieriniefu) | Early adoption and fan service reinstallation feedback |
| [@noob-cpu](https://github.com/noob-cpu) | FileRepository persistence report |
| [@PirateAndy596](https://github.com/PirateAndy596) | AiCharger driver safety question |

---

## Contributing

This project is now maintained as a full repository (migrated from the original Gist). Contributions are welcome:

1. **Issues** — Report bugs, suggest new ASUS components to clean, or document laptop-specific caveats
2. **Pull Requests** — Add new cleanup targets, fix edge cases, improve safety checks
3. **Testing** — Run the script and report results for your specific ASUS hardware configuration

Please include your ASUS hardware model and Windows version when reporting issues.

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## Disclaimer

This tool performs **deep system modifications** including service deletion, driver removal, and registry cleanup. While it creates backups before each deletion, **use at your own risk**. Always maintain a full system backup before running. The authors are not responsible for any system issues resulting from use of this tool.

---

*Migrated from [GitHub Gist](https://gist.github.com/allenk/fcbee909fbf8fb9a54d4484297a1eeba) (est. April 2023, 156 stars, 24 revisions) to enable structured maintenance and community contributions.*
