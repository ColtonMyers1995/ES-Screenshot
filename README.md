# ArkOS Screenshot Tool

A lightweight EmulationStation screenshot utility for ArkOS handhelds.

This tool allows you to capture screenshots directly from EmulationStation using a controller button combination.

---

## Supported Devices

Tested and confirmed working on:

* R36H
* R36S
* R46H

Likely compatible with many other RK3326/RK3566 ArkOS handhelds using EmulationStation.

---

## Features

* In-game and EmulationStation screenshot support
* Persistent background daemon
* Automatic screenshot exporting
* Lightweight ArkOS-friendly design
* Uses framebuffer capture through FFmpeg
* Dependencies Pre-Compiled

---

## Installation

Extract ALL items directly into:

```bash
/roms/tools/
```

Final structure should look like:

```bash
/roms/tools/ES-Screenshot.sh
/roms/tools/Disable-ES-Screenshot.sh
/roms/tools/ESScreenshot/
```

---

## Usage

### Enable Screenshot Daemon

Launch:

```bash
ES-Screenshot.sh
```

from the ArkOS Tools/Ports menu.

This enables the persistent screenshot daemon.

---

### Take Screenshot

Press:

```bash
L2 + R2
```

at the same time to capture a screenshot.

---

### Disable Screenshot Daemon

Launch:

```bash
Disable-ES-Screenshot.sh
```

to stop the background screenshot daemon without rebooting ArkOS.

---

## Screenshot Location

Screenshots are automatically saved to:

```bash
/roms/backup
```

---

## Notes

* The screenshot daemon continues running after exiting the launcher.
* FFmpeg must be available on the ArkOS image.
* Designed specifically for ArkOS EmulationStation environments.
* Some devices may require different input event mappings.

---

## Credits

Created for taking screenshots of ES-Theme ecosystems, ArkOS tools/ports, etc.

Built and refined through extensiv