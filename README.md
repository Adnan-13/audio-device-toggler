# Audio Device Toggler

## Overview

The Audio Device Toggler is a PowerShell script designed to easily switch between two specified audio devices on a Windows computer. This is especially useful if you frequently switch between different audio devices, such as speakers and headphones.

## Features

- Simple toggle between two audio devices.
- User-friendly with an easy setup process.
- Confirmation message indicating the currently active device.

## Prerequisites

- Windows operating system.
- [PowerShell](https://github.com/PowerShell/PowerShell/releases/latest).
- [AudioDeviceCmdlets](https://www.powershellgallery.com/packages/AudioDeviceCmdlets) PowerShell module.

## Installation

### 1. Install the AudioDeviceCmdlets Module

1. Open PowerShell as an administrator.
2. Run the following command to install the `AudioDeviceCmdlets` module:

   ```powershell
   Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser
   ```

### 2. Download the Script

1. Clone the repository or download the ZIP file from the [GitHub repository](https://github.com/adnan-13/audio-device-toggler):

   ```bash
   git clone https://github.com/adnan-13/audio-device-toggler.git
   ```
2. Extract the ZIP file if downloaded or navigate to the cloned repository folder.

### 3. Configure the Script

1. Open the script file `Toggle-AudioDevice.ps1` in a text editor.
2. Edit the `$device1` and `$device2` variables to match the names of the audio devices you want to toggle between. Use the exact names as listed by the `Get-AudioDevice -List` command. Here's mine for example

   ```powershell
   $device1 = "Headphones (Razer USB Sound Card)"
   $device2 = "Speakers (Realtek(R) Audio)"
   ```

### 4. Create a Desktop Shortcut

1. Right-click on your desktop and select "New" > "Shortcut".
2. Enter the following command in the location field:

   ```plaintext
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Path\To\Your\Script\Toggle-AudioDevice.ps1"
   ```

## Troubleshooting

- **Script Not Working**: Ensure you have the `AudioDeviceCmdlets` module installed and the script path is correct in your shortcut.
- **Device Not Found**: Verify that the device names in the script match exactly with the names listed by `Get-AudioDevice -List`.


## Support

If you encounter any issues or need further assistance, please open an issue on the [GitHub repository](https://github.com/adnan-13/audio-device-toggler/issues). I will do our best to assist you.