@echo off
SETLOCAL EnableDelayedExpansion

SET _ISADMIN=0
call :checkadmin
if %_ISADMIN% NEQ 1 echo Must run as admin^^!^^! & goto :Done

:chrome
SET INSTALL_=
set /p INSTALL_="Install chrome ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto cloudfoundry-cli
choco upgrade googlechrome -y

:cloudfoundry-cli
SET INSTALL_=
set /p INSTALL_="Install cloudfoundry-cli ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto jdk8
choco upgrade cloudfoundry-cli -y

:jdk8
SET INSTALL_=
set /p INSTALL_="Install jdk8 ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto maven
choco upgrade jdk8 -y -params "source=false"

:maven
SET INSTALL_=
set /p INSTALL_="Install maven ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto eclipse
choco upgrade maven -y

:eclipse
SET INSTALL_=
set /p INSTALL_="Install eclipse ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto springtoolsuite
choco upgrade eclipse -y

:springtoolsuite
SET INSTALL_=
set /p INSTALL_="Install springtoolsuite ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto soapui
choco upgrade springtoolsuite -y

:soapui
SET INSTALL_=
set /p INSTALL_="Install soapui ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto postman
choco upgrade soapui -y

:postman
SET INSTALL_=
set /p INSTALL_="Install postman ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto Done
choco upgrade postman -y

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