# Get the current username dynamically
$userName = $env:USERNAME

# Define the base path to the modules directory
$baseModulePath = "C:\Users\$userName\Documents\PowerShell\Modules\AudioDeviceCmdlets"

# Find the latest version of the AudioDeviceCmdlets module dynamically
$moduleVersion = Get-ChildItem -Path $baseModulePath -Directory | Sort-Object Name -Descending | Select-Object -First 1

if (-not $moduleVersion) {
	Write-Error "The AudioDeviceCmdlets module could not be found. Make sure it is installed."
	exit
}

# Construct the full module path
$modulePath = Join-Path -Path $baseModulePath -ChildPath $moduleVersion.Name

# Import the AudioDeviceCmdlets module
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
