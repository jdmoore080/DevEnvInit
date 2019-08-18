@echo off
SETLOCAL EnableDelayedExpansion

SET _ISADMIN=0
call :checkadmin
if %_ISADMIN% NEQ 1 echo Must run as admin^^!^^! & goto :Done

:Chocolatey
:: Install choco .exe and add choco to PATH
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco feature enable -n useRememberedArgumentsForUpgrades

:: Install all the packages
:::: Browsers
rem choco upgrade googlechrome -y

:::: Utilities + other
choco upgrade 7zip.install -y
choco upgrade winmerge -y
rem choco upgrade notepad2-mod -y
choco upgrade notepad3 -y

:::: configure
rem notepad2-mod
rem UpdateINI -s Settings SaveRecentFiles 1 "%APPDATA%\Notepad2\Notepad2.ini"
rem UpdateINI -s Settings SaveFindReplace 1 "%APPDATA%\Notepad2\Notepad2.ini"
rem UpdateINI -s Settings TabsAsSpaces 1 "%APPDATA%\Notepad2\Notepad2.ini"
rem UpdateINI -s Settings ViewWhiteSpace 1 "%APPDATA%\Notepad2\Notepad2.ini"

rem notepad3
UpdateINI -s Settings SaveRecentFiles 1 "%APPDATA%\Rizonesoft\Notepad3\Notepad3.ini"
UpdateINI -s Settings SaveFindReplace 1 "%APPDATA%\Rizonesoft\Notepad3\Notepad3.ini"
UpdateINI -s Settings TabsAsSpaces 1 "%APPDATA%\Rizonesoft\Notepad3\Notepad3.ini"
UpdateINI -s Settings ViewWhiteSpace 1 "%APPDATA%\Rizonesoft\Notepad3\Notepad3.ini"

goto Done

:UtilityFunctions

:checkadmin
openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 (
SET _ISADMIN=0
) else (
SET _ISADMIN=1
)
goto :eof

:Done
ENDLOCAL & SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
refreshenv
