$liste_app = @('firefox', 'notepad', 'sublime_text', 'Deezer', 'WinStore.App')

# Variable to infinite loop
$olive = 1

Remove-Job *

$job_running = $null

do {

    $liste_app | ForEach-Object {

        $process = Get-Process -Name $_ -ErrorAction SilentlyContinue

        if ($process -ne $null) {
            
            Echo "$_ actif"
            $job_running = Get-Job -Name $_"_analyser" -ErrorAction SilentlyContinue

            if ($job_running -eq $null) {

                Start-Job -Name $_"_analyser" -FilePath C:\UPHF-M2-GreenComputing\Script_Analyse.ps1 -ArgumentList @($_, "C:\UPHF-M2-GreenComputing")
                
            }

        } else {

            Echo "$_ inactif"
            
            $job_running = Get-Job -Name $_"_analyser" -ErrorAction SilentlyContinue

            if ($job_running -ne $null -and $job_running.State -ne "Running") {
                
                Remove-Job -Name $_"_analyser"
                Write-Host "Job removed"
                
            }

            Set-Variable -Name $_"_status" -Value 0
            $running = 0
            $job_running = $null

        }

        Start-Sleep -Seconds 1
        
    }

} while ($olive)