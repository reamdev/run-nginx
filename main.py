from os import path, getcwd
from sys import argv
# from subprocess import call
from subprocess import Popen

totalParams=1

if (len(argv) > 1):
  fileRoute = path.abspath(getcwd())
  action = argv[1]

  if action == 'start':
    # call([fr'{fileRoute}\scripts\nginx-start.bat'])
    startProcess = Popen(['powershell.exe', fr'{fileRoute}\scripts\nginx-start.ps1'])
    startProcess.communicate()
  elif action == 'stop':
    # call([fr'{fileRoute}\scripts\nginx-stop.bat'])
    stopProcess = Popen(['powershell.exe', fr'{fileRoute}\scripts\nginx-stop.ps1'])
    stopProcess.communicate()
  elif action == 'restart':
    print('              Reiniciando Servicios...\n')
    # call([fr'{fileRoute}\scripts\nginx-stop.bat'])
    restartProcess1 = Popen(['powershell.exe', fr'{fileRoute}\scripts\nginx-stop.ps1'])
    restartProcess1.communicate()

    print('')
    # call([fr'{fileRoute}\scripts\nginx-start.bat'])
    restartProcess2 = Popen(['powershell.exe', fr'{fileRoute}\scripts\nginx-start.ps1'])
    restartProcess2.communicate()
else:
  print(f'El script necesita de {totalParams} parametro{"s" if totalParams>1 else ""}:\n  accion: (start, stop, restart)')
