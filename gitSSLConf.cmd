@echo off
SETLOCAL EnableDelayedExpansion

SET _ISADMIN=0
call :checkadmin
if %_ISADMIN% NEQ 1 echo Must run as admin^^!^^! & goto :Done

SET INSTALL_=
set /p INSTALL_="Refresh CA cert bundle with certs from the windows cert store ? [y/n]"
if /I "%INSTALL_:~0,1%" NEQ "y" Goto GitPad

REM export the windows certs
REM maybe replace this step by using the schannel support available as of 2.14
BundleWinCerts "C:\Program Files\Git\mingw64\ssl\certs\ca-bundle.crt" "C:\Program Files\Git\mingw64\ssl\certs\ca-bundle-plusWinRoot.crt"
git config --system http.sslcainfo "C:/Program Files/Git/mingw64/ssl/certs/ca-bundle-plusWinRoot.crt"

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
ENDLOCAL