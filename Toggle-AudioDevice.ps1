# Import the AudioDeviceCmdlets module with the correct path
$modulePath = "C:\Users\adnan\Documents\PowerShell\Modules\AudioDeviceCmdlets\3.1.0.2"
Import-Module "$modulePath\AudioDeviceCmdlets.psd1"

# Load the System.Windows.Forms assembly
Add-Type -AssemblyName System.Windows.Forms

# Define the full names of the two devices you want to toggle between
$device1 = "Headphones (Razer USB Sound Card)"
$device2 = "Speakers (Realtek(R) Audio)"

# Get the current default audio device
$currentDevice = Get-AudioDevice -Playback

# Find the device indexes
$device1Index = (Get-AudioDevice -List | Where-Object { $_.Name -eq $device1 }).Index
$device2Index = (Get-AudioDevice -List | Where-Object { $_.Name -eq $device2 }).Index

# Validate that both devices were found
if (-not $device1Index) {
	[System.Windows.Forms.MessageBox]::Show("Error: '$device1' not found.", "Audio Toggle")
	exit
}

if (-not $device2Index) {
	[System.Windows.Forms.MessageBox]::Show("Error: '$device2' not found.", "Audio Toggle")
	exit
}

# Determine the next device to switch to
if ($currentDevice.Name -eq $device1) {
	Set-AudioDevice -Index $device2Index
	$switchedTo = $device2
}
else {
	Set-AudioDevice -Index $device1Index
	$switchedTo = $device1
}

# Display confirmation box
[System.Windows.Forms.MessageBox]::Show("Switched to $switchedTo", "Audio Toggle")
