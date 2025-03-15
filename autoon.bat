@echo off
:loop
tasklist /FI "IMAGENAME eq canary-sln.exe" 2>NUL | find /I /N "canary-sln.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo Servidor rodando...
) else (
    echo o Servidor nao esta rodando. Iniciando Servidor...
    start "" "canary-sln.exe"
)
timeout /t 1 /nobreak
goto loop