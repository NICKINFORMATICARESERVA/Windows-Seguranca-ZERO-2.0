@echo off

:: Desativar Windows Defender via Registro
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f

:: Parar o serviço do Windows Defender 
sc stop WinDefend
sc config WinDefend start= disabled

:: Desativar o Firewall do Windows
netsh advfirewall set allprofiles state off

:: Desabilitar notificações de segurança que avisa que o fw está desligado com o botão para religar
reg add "HKLM\SOFTWARE\Microsoft\Security Center\Feature" /v DisableNotifications /t REG_DWORD /d 1 /f

echo  Reinicie o computador
