reg
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" >nul 2>&1

if %errorlevel% == 0 (
    echo Запись WorkBat уже существует в реестре!
) else (
    echo Записи WorkBat нет в реестре. Можно добавлять.
)
