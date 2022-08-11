$nginxRun = tasklist.exe | findstr.exe "nginx.exe"
$phpCGIRun = tasklist.exe | findstr.exe "php-cgi.exe"

$nginxErr = $false
$phpCGIErr = $false

if ((($nginxRun -eq $null)) -or (($phpCGIRun -eq $null))) {
  Write-Output "              Iniciando NGINX con PHP"

  if ($phpCGIRun -eq $null) {
    Write-Output ""
    Write-Output "Iniciando PHP FastCGI..."
    C:\RunHiddenConsole.exe C:\php7.4.30\php-cgi.exe -b 127.0.0.1:9090 -c C:\php7.4.30\php.ini

    if ((tasklist.exe | findstr.exe "php-cgi.exe") -ne $null) {
      Write-Output "PHP FastCGI Iniciado"
    } else {
      Write-Output "No se pudo iniciar PHP FastCGI correctamente :("
      $phpCGIErr = $true
    }
  }

  if ($nginxRun -eq $null) {
    Write-Output ""
    Write-Output "Iniciando NGINX..."

    Set-Location C:\nginx
    Start-Process nginx

    if ((tasklist.exe | findstr.exe "nginx.exe") -ne $null) {
      Write-Output "NGINX Iniciado"
    } else {
      Write-Output "No se pudo iniciar NGINX correctamente :("
      $
    }
  }

  Write-Output ""
  Write-Output "NGINX con PHP iniciado :D/"
} else {
  Write-Host "              El servicio ya esta iniciado ;-;"
}
