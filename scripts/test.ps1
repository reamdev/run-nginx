$value = tasklist.exe | findstr.exe "nginx.exe"

if ($value) {
  Write-Host "Is not null"
} else {
  Write-Host "Is null"
}