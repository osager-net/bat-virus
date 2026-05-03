:: (Запрет открытия диспетчера задач)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f
echo Диспетчер задач запрещён к запуску.
