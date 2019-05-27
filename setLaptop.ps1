param
(
   [String[]]
   $Title
)

$services = Get-Content "C:\Users\Dupon\Desktop\UPHF-M2-GreenComputing\test.JSON" | ConvertFrom-Json

if($Title -ne $null){
    [System.Collections.ArrayList]$CPU = @()
    [System.Collections.ArrayList]$luminosity = @()
    [System.Collections.ArrayList]$sound = @()
    [System.Collections.ArrayList]$WiFi = @()
    [System.Collections.ArrayList]$RAM = @()

    foreach($service in $Title){
        $CPU.Add($services.$service.CPU)
        $luminosity.Add($services.$service.luminosity)
        $sound.Add($services.$service.sound)
        $RAM.Add($services.$service.RAM)
        $WiFi.Add($services.$service.'Wi-Fi')
    }

    $luminosityMax = $luminosity | measure -Maximum
    $soundMax = $sound | measure -Maximum
    $WifiNeed = $false

    foreach($bool in $WiFi){
        if($bool -eq $true){
            $WifiNeed = $true
        }
    }

    Set-AudioDevice -PlaybackVolume $soundMax.Maximum
    (Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,$luminosityMax.Maximum)
    if($WifiNeed -eq $true){
        Enable-NetAdapter -Name Wi-Fi -Confirm:$false
    }
    elseif($WifiNeed -eq $false){
         Disable-NetAdapter -Name Wi-Fi -Confirm:$false
    }

    foreach($str in $Title){
        get-process $str -ErrorAction SilentlyContinue | % { $_.ProcessorAffinity=$services.$str.CPU }
    }
}else{
    Set-AudioDevice -PlaybackVolume 0
    (Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,50)
    Disable-NetAdapter -Name Wi-Fi -Confirm:$false
}