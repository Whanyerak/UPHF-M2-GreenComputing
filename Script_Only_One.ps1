$liste_app = @('firefox', 'notepad', 'sublime_text')

# Variable to infinite loop
$olive = 1

$job_running = $null

do {

    $liste_app | ForEach-Object {

        $process = Get-Process -Name $_ -ErrorAction SilentlyContinue

        if ($process -ne $null) {
            
            Echo "$_ actif"
            $job_running = Get-Job -Name $_"_analyser" -ErrorAction SilentlyContinue

            if ($job_running -eq $null) {

                #$app = Start-Process powershell -ArgumentList ".\Script_Analyse.ps1 -Title $_" -PassThru -UseNewEnvironment
                Start-Job -Name $_"_analyser" -FilePath {.\Script_Analyse.ps1} -ArgumentList $_
                
            }

        } else {

            Echo "$_ inactif"
            Set-Variable -Name $_"_status" -Value 0
            $running = 0
            $job_running = $null

        }

        # Get-Variable -Name $_"_status" -ValueOnly

        # Start-Process notepad -Passthru
        # $total = $total + $process

        #echo $total

        Start-Sleep -Seconds 1
        
    }

} while ($olive)