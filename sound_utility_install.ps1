wget https://github.com/frgnca/AudioDeviceCmdlets/releases/download/v3.0/AudioDeviceCmdlets.dll -OutFile .\Utilities\AudioDeviceCmdlets.dll
Start-Sleep 3
New-Item "$($profile | split-path)\Modules\AudioDeviceCmdlets" -Type directory -Force
Start-Sleep 2
Copy-Item ".\Utilities\AudioDeviceCmdlets.dll" "$($profile | split-path)\Modules\AudioDeviceCmdlets\AudioDeviceCmdlets.dll"
Start-Sleep 1
Set-Location "$($profile | Split-Path)\Modules\AudioDeviceCmdlets"
Start-Sleep 1
Get-ChildItem | Unblock-File
Start-Sleep 1
Import-Module AudioDeviceCmdlets
cd "C:\UPHF-M2-GreenComputing"  
Write-Host " "
Write-Host "Successfully installed"