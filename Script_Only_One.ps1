$liste_app = @('firefox', 'notepad', 'sublime_text')

# Variable to infinite loop
$olive = 1

Remove-Job *

$job_running = $null
$root_path = Get-Location
$root_path = $root_path.ToString()
$root_path

do {

    $liste_app | ForEach-Object {

        $process = Get-Process -Name $_ -ErrorAction SilentlyContinue

        if ($process -ne $null) {
            
            Echo "$_ actif"
            $job_running = Get-Job -Name $_"_analyser" -ErrorAction SilentlyContinue

            if ($job_running -eq $null) {

                #$app = Start-Process powershell -ArgumentList ".\Script_Analyse.ps1 -Title $_" -PassThru -UseNewEnvironment
                Start-Job -Name $_"_analyser" -FilePath .\Script_Analyse.ps1 -ArgumentList @($_,$root_path)
                
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