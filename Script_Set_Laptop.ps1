$liste_app = @('firefox', 'notepad', 'sublime_text', 'Deezer', 'WinStore.App')

# Variable to infinite loop
$loop = 1

Remove-Job *

$job_running = $null

[System.Collections.ArrayList]$apps = @()

do {
    
    $liste_app | ForEach-Object {
        
        $process = Get-Process -Name $_ -ErrorAction SilentlyContinue
        
        if ($process -ne $null) {  
            $apps.Add($_)
       }
    }
    $apps
    If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  # Relaunch as an elevated process:
  Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
  exit
}
# Now running elevated so launch the script:
& "C:\UPHF-M2-GreenComputing\setLaptop.ps1" $apps

    # Start-Process - powershell.exe ".\Desktop\UPHF-M2-GreenComputing\setLaptop.ps1"
    Start-Sleep -Seconds 1
    $apps = @()
} while ($loop)