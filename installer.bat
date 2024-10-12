@echo off
chcp 65001 >nul
cscript "%~dp0bin\installer.vbs"
cls
echo.
echo Закончил, чекни рабочий стол там будет ярлык!
echo.
pause >nul