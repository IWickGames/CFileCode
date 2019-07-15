@echo off
color 97
goto check_Permissions

:check_Permissions
cls
echo.
echo.
echo.
echo.
echo --------------------
echo.
echo     Cfile Code
echo   IWickGames#7827
echo --------------------
echo.
echo.
echo Checking if running as admin...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Program is running as admin, starting...
	goto start
) else (
    echo Failure: Program is not running as admin, please start CMD with admin perms...
	goto exit
)

if not exist "C:\CFilePlugins" goto firstsetup
:start
cls
echo.
echo.
echo.
echo.
echo --------------------
echo.
echo     Cfile Code
echo   IWickGames#7827
echo --------------------
echo.
echo.
echo Grabbing Plugins...
dir /b "C:\CFilePlugins"
echo.
echo   Select a Plugin
echo.
set /p plugin=">"
if exist "C:\CFilePlugins\%plugin%" goto runplugin

:runplugin
echo Starting %plugin% ...
call "C:\CFilePlugins\%plugin%"
echo.
echo.
echo %plugin% Exited!
timeout /nobreak 5 >nul
goto start


:firstsetup
cls
echo.
echo.
echo.
echo.
echo --------------------
echo.
echo     Cfile Code
echo   IWickGames#7827
echo --------------------
echo.
echo.
echo Preparing first setup...
mkdir "C:\CFilePlugins"
echo Complete!
timeout /nobreak 3 >nul
goto start

:exit
color 07