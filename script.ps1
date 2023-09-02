# Getting system information noting that I am using windows 10 pro
$systemInfo = Get-WmiObject Win32_ComputerSystem
$osInfo = Get-WmiObject Win32_OperatingSystem
$processorInfo = Get-WmiObject Win32_Processor

# Creatting a string with system information
$infoString = @"
These are The System Information
----- --- --- ------ ------------
Manufacturer: $($systemInfo.Manufacturer)
Model: $($systemInfo.Model)
Operating System: $($osInfo.Caption)
Version: $($osInfo.Version)
Architecture: $($osInfo.OSArchitecture)
Processor: $($processorInfo.Name)
Cores: $($processorInfo.NumberOfCores)
"@

# Saving the information to a file on our desktop directory as "system_info.txt"
$outputFile = "system_info.txt"
$infoString | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host "System information saved to $outputFile"

#Note, this code can be executed using command prompt command: powershell -File script.ps1