@echo off
set "filename=work.bat"
set "desktop=%USERPROFILE%\Desktop"
set "downloads=%USERPROFILE%\Downloads"

:: Проверяем рабочий стол
if exist "%desktop%\%filename%" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WorkBat" /t REG_SZ /d "%desktop%\%filename%" /f
    goto :end
)

:: Проверяем «Загрузки»
if exist "%downloads%\%filename%" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WorkBat" /t REG_SZ /d "%downloads%\%filename%" /f
)

:end
