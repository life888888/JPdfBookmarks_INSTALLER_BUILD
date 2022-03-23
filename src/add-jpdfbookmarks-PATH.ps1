$dir = Get-Location

$dir = Split-Path -Path $dir -Parent

$path = [Environment]::GetEnvironmentVariable('PATH', 'User') -split ';' |
        Where-Object { $_ -ne $dir }
$path += $dir
[Environment]::SetEnvironmentVariable('PATH', ($path -join ';'), 'User')
