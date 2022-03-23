$dir = Get-Location

$path = [Environment]::GetEnvironmentVariable('PATH', 'User') -split ';' |
        Where-Object { $_ -ne $dir }
$path += $dir
[Environment]::SetEnvironmentVariable('PATH', ($path -join ';'), 'User')
