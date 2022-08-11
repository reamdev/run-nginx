$nginxRun = tasklist.exe | findstr.exe "nginx.exe"
$phpCGIRun = tasklist.exe | findstr.exe "php-cgi.exe"

if ((($null -ne $nginxRun)) -or (($null -ne $phpCGIRun))) {
  Write-Output "              Deteniendo NGINX con PHP"

  if (($null -ne $nginxRun)) {
    Write-Output ""
    Write-Output "Deteniendo NGINX..."
    taskkill /f /IM nginx.exe
  }

  if (($null -ne $phpCGIRun)) {
    Write-Output ""
    Write-Output "Deteniendo PHP CGI..."
    taskkill /f /IM php-cgi.exe
  }

  Write-Output ""
  Write-Output "Procesos Detenidos :c"
} else {
  Write-Host "              El servicio no esta iniciado ;-;"
}