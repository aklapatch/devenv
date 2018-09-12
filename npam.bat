echo off

:usage
if  "%2"=="" (
echo Usage: npam.bat command recipename
echo Command list: install purge remove
goto :eof
)



set "repdir=%~dp0recipies"
echo %repdir%
if exist 7-Zip path %~dp0\7-zip;%PATH% else call %repdir%\7zip.bat

if "%1"=="install" call %repdir%\%2


