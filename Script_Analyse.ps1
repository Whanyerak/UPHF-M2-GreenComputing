param
(
   [String]
   [Parameter(Mandatory)]
   $Title
)
Start-Process $Title #debug
$log = ""
$process = Get-Process -Name $Title
$file = $Title.ToString() + ".txt"
$DateDebut = Get-Date
"Date of process start : " + $DateDebut.ToString()  > $file
"ProcessName`tCPU`n" >> $file

while ($process)
{
   try{
       $process = Get-Process -Name $Title -ErrorAction Stop | Select-Object ProcessName, CPU
       "`n" + $process[0].ProcessName + "`t`t" + $process[0].CPU >> $file

       Start-Sleep -Seconds 1
    }
    catch{
        #écriture dans le fichier
        break
    }
}
$DateFin = Get-Date
"Date of process end : " + $DateFin.ToString() >> $file

"Temps écoulé : " + ((Get-Date $DateFin) – (Get-Date $DateDebut)).tostring() >> $file