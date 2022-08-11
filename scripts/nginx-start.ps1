$nginxRun = tasklist.exe | findstr.exe "nginx.exe"
$phpCGIRun = tasklist.exe | findstr.exe "php-cgi.exe"

$nginxErr = $false
$phpCGIErr = $false

if ((($null -eq $nginxRun)) -or (($null -eq $phpCGIRun))) {
  Write-Output "              Iniciando NGINX con PHP"

  if ($null -eq $phpCGIRun) {
    Write-Output ""
    Write-Output "Iniciando PHP FastCGI..."
    C:\RunHiddenConsole.exe C:\php7.4.30\php-cgi.exe -b 127.0.0.1:9090 -c C:\php7.4.30\php.ini

    if ($null -ne (tasklist.exe | findstr.exe "php-cgi.exe")) {
      Write-Output "PHP FastCGI Iniciado"
    } else {
      Write-Output "No se pudo iniciar PHP FastCGI correctamente :("
      $phpCGIErr = $true
    }
  }

  if ($null -eq $nginxRun) {
    Write-Output ""
    Write-Output "Iniciando NGINX..."

    Set-Location C:\nginx
    Start-Process nginx

    if ($null -ne (tasklist.exe | findstr.exe "nginx.exe")) {
      Write-Output "NGINX Iniciado"
    } else {
      Write-Output "No se pudo iniciar NGINX correctamente :("
      $nginxErr = $true
    }
  }

  Write-Output ""
  if (($false -eq $phpCGIErr) -and ($false -eq $nginxErr)) {
    Write-Output "NGINX con PHP iniciado :D/"
  } elseif (($true -eq $phpCGIErr) -or ($true -eq $nginxErr)) {
    Write-Output "NGINX con PHP iniciado con errores :|"

    if ($true -eq $phpCGIErr) {
      Write-Output "PHP FastCGI error."
    }
    if ($true -eq $nginxErr) {
      Write-Output "NGINX error."
    }
  }
} else {
  Write-Host "              El servicio ya esta iniciado ;-;"
}
