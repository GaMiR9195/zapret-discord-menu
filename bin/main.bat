@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title pidor unblock

:menu
cls
echo.                                                                                 
echo    ^_^_^_^_^_^_^_^_   ^_^_^_   ^_^_^_^_^_^_^_^_   ^_^_^_^_^_^_^_^_   ^_^_^_^_^_^_^_^_ 
echo   ^|^\   ^_^_  ^\ ^|^\  ^\ ^|^\   ^_^_^_ ^\ ^|^\   ^_^_  ^\ ^|^\   ^_^_  ^\  
echo   ^\ ^\  ^\^|^\  ^\^\ ^\  ^\^\ ^\  ^\^_^|^\ ^\^\ ^\  ^\^|^\  ^\^\ ^\  ^\^|^\  ^\  
echo    ^\ ^\   ^_^_^_^_^\^\ ^\  ^\^\ ^\  ^\ ^\^\ ^\^\ ^\  ^\^\^\  ^\^\ ^\   ^_  ^_^\  
echo     ^\ ^\  ^\^_^_^_^| ^\ ^\  ^\^\ ^\  ^\^_^\^\ ^\^\ ^\  ^\^\^\  ^\^\ ^\  ^\^\  ^\^| 
echo      ^\ ^\^_^_^\     ^\ ^\^_^_^\^\ ^\^_^_^_^_^_^_^_^\^\ ^\^_^_^_^_^_^_^_^\^\ ^\^_^_^\^\ ^_^\ 
echo       ^\^|^_^_^|      ^\^|^_^_^| ^\^|^_^_^_^_^_^_^_^| ^\^|^_^_^_^_^_^_^_^| ^\^|^_^_^|^\^|^_^_^|
echo.
echo.
echo.
echo 1. Обход блокировки YouTube
echo 2. Обход блокировки Discord
echo 3. YouTube и Discord
echo 4. Выход

echo.
set /p choice="Я хочу -> "

if "%choice%"=="1" goto youtube_menu
if "%choice%"=="2" goto discord_menu
if "%choice%"=="3" goto general
if "%choice%"=="4" exit

:youtube_menu
cls
echo 1. Запуск обхода YouTube
echo 2. Добавить в автозагрузку
echo 3. Удалить из автозагрузки
echo 4. Выход

echo.
set /p choice="Я хочу -> "

if "%choice%"=="1" goto start_youtube
if "%choice%"=="2" goto add_to_startup_youtube
if "%choice%"=="3" goto remove_from_startup_youtube
if "%choice%"=="4" exit

:start_youtube
start "zapret: youtube" /min "%~dp0\winws.exe" --wf-tcp=443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="%~dp0\list-youtube.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-tcp=443 --hostlist="%~dp0\list-youtube.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0\tls_clienthello_www_google_com.bin"
exit

:add_to_startup_youtube
echo Добавление YouTube в автозагрузку...
set startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
echo @echo off > "%startupFolder%\start_program.bat"
echo start "zapret: discord" /min "%~dp0\winws.exe" --wf-tcp=443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="%~dp0\list-youtube.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-tcp=443 --hostlist="%~dp0\list-youtube.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0\tls_clienthello_www_google_com.bin" >> "%startupFolder%\start_program.bat"
echo exit >> "%startupFolder%\start_program.bat"
goto menu

:remove_from_startup_youtube
echo Удаление YouTube из автозагрузки...
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\start_youtube.bat" >nul 2>&1
goto menu

:discord_menu
cls
echo 1. Запуск обхода Discord
echo 2. Добавить в автозагрузку
echo 3. Удалить из автозагрузки
echo 4. Выход

echo.
set /p choice="Я хочу -> "

if "%choice%"=="1" goto start_discord
if "%choice%"=="2" goto add_to_startup_discord
if "%choice%"=="3" goto remove_from_startup_discord
if "%choice%"=="4" exit

:start_discord
start "zapret: discord" /min "%~dp0\winws.exe" --wf-tcp=443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="%~dp0\list-discord.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-tcp=443 --hostlist="%~dp0\list-discord.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0\tls_clienthello_www_google_com.bin"
exit

:add_to_startup_discord
echo Добавление Discord в автозагрузку...
set startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
echo @echo off > "%startupFolder%\start_discord.bat"
echo start "" "%~dp0\winws.exe" --wf-tcp=443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="%~dp0\list-discord.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-tcp=443 --hostlist="%~dp0\list-discord.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0\tls_clienthello_www_google_com.bin" >> "%startupFolder%\start_discord.bat"
echo exit >> "%startupFolder%\start_discord.bat"
goto menu

:remove_from_startup_discord
echo Удаление Discord из автозагрузки...
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\start_discord.bat" >nul 2>&1
goto menu

:general
start "zapret: youtube and discord" /min "%~dp0\winws.exe" --wf-tcp=443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="%~dp0\list-general.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0\quic_initial_www_google_com.bin" --new --filter-tcp=443 --hostlist="%~dp0\list-general.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0\tls_clienthello_www_google_com.bin"
exit