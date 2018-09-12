@echo off
if exist install cd install
set VAR=%~dp0;%~dp07-Zip

for /d %%D in (*) do call :concat %%~fD

path %VAR%;%PATH%
goto :endof

:concat 
set VAR=%1;%VAR%
if exist %1\bin set VAR=%1\bin;%VAR%
goto :eof

:endof
cd ..
cmd  /k
