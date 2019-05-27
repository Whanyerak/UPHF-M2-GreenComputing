param
(
   [String]$Title,
   [String]$Root_path
)

#Start-Process $Title #debug
$log = ""
$process = Get-Process -Name $Title
$DateDebut = Get-Date

$path = "$Root_path\workingFiles\"

If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
$file = $path + $Title.ToString() + $DateDebut.ToString("yyyyMMddhhmmss") + ".txt"
"Date of process start : " + $DateDebut.ToString()  > $file
"ProcessName`tCPU`n" >> $file

while ($process)
{
   try{
       $process = Get-Process -Name $Title -ErrorAction Stop

       "`n" + $process[0].ProcessName + "`t`t" + $process[0].CPU >> $file

       Start-Sleep -Seconds 1
    }
    catch{
        break
    }
}

$DateFin = Get-Date
"Date of process end : " + $DateFin.ToString() >> $file

"Temps écoulé : " + ((Get-Date $DateFin) – (Get-Date $DateDebut)).tostring() >> $file