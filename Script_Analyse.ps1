param
(
   [String]
   [Parameter(Mandatory)]
   $Title
)

$total =""

do
{
    Try {
        $process = Get-Process -Name $Title -ErrorAction Stop | Format-Table `
            @{Label = "NPM(K)"; Expression = {[int]($_.NPM / 1024)}},
            @{Label = "PM(K)"; Expression = {[int]($_.PM / 1024)}},
            @{Label = "WS(K)"; Expression = {[int]($_.WS / 1024)}},
            @{Label = "VM(M)"; Expression = {[int]($_.VM / 1MB)}},
            @{Label = "CPU(s)"; Expression = {if ($_.CPU) {$_.CPU.ToString("N")}}},
            Id, ProcessName -AutoSize| Out-String

        $total = $total + $process

        #echo $total

        Start-Sleep -Seconds 1
    }
    Catch
    {
        echo "pas en cours"
        Start-Sleep -Seconds 1
        break
    }

} while ($process)

echo $total