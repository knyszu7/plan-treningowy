@echo off
REM Podwojny klik na ten plik uruchamia lokalny serwer testowy aplikacji.
REM Nastepnie otworz w przegladarce: http://localhost:8000
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
