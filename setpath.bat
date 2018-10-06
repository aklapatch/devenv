@echo off
if exist install cd install
set VAR=%~dp0;%~dp07-Zip

for /d %%D in (*) do call :concat %%~fD

path %VAR%;%PATH%
:: set clang to target gnu 
doskey clang=clang -target x86_64-pc-windows-gnu $*
doskey clang++=clang++ -target x86_64-pc-windows-gnu $*

goto :endof

:concat 
set VAR=%1;%VAR%
if exist %1\bin set VAR=%1\bin;%VAR%
if exist %1\Scripts set VAR=%1\Scripts;%VAR%
if exist %1\libexec set VAR=%1\libexec;%VAR%
if exist %1\perl\bin set VAR=%1\perl\bin;%VAR%
goto :eof

:endof
cd ..
cmd  /k
