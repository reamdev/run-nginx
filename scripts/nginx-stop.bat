@ECHO OFF

ECHO Deteniendo NGINX...
taskkill /f /IM nginx.exe

ECHO Deteniendo PHP CGI...
taskkill /f /IM php-cgi.exe

EXIT /b