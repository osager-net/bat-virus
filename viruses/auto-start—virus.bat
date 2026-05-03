:: (Проверка существования автозапуска в реестре)
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" >nul 2>&1

:: (Проверка ошибок, и когда автозапуск отсутствует он добавлятся)
if %errorlevel% == 0 (
    goto :end
) else (
    echo Записи WorkBat нет в реестре. Можно добавлять.
)

:end
