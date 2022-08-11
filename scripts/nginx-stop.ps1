$nginxRun = tasklist.exe | findstr.exe "nginx.exe"
$phpCGIRun = tasklist.exe | findstr.exe "php-cgi.exe"

if ((($nginxRun -ne $null)) -or (($phpCGIRun -ne $null))) {
  Write-Output "              Deteniendo NGINX con PHP"

  if (($nginxRun -ne $null)) {
    Write-Output ""
    Write-Output "Deteniendo NGINX..."
    taskkill /f /IM nginx.exe
  }

  if (($phpCGIRun -ne $null)) {
    Write-Output ""
    Write-Output "Deteniendo PHP CGI..."
    taskkill /f /IM php-cgi.exe
  }

  Write-Output ""
  Write-Output "Procesos Detenidos :c"
} else {
  Write-Host "              El servicio no esta iniciado ;-;"
}