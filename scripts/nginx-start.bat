@ECHO OFF

ECHO Iniciando PHP FastCGI...
C:\RunHiddenConsole.exe C:\php7.4.30\php-cgi.exe -b 127.0.0.1:9090 -c C:\php7.4.30\php.ini

ECHO Iniciando NGINX
SET /P Ruta=C:\nginx
start nginx

popd
EXIT /b