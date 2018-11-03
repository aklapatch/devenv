@echo off
SETLOCAL EnableDelayedExpansion

:: scoop directory
set "SCOOP_GLOBAL=%~dp0scoop\apps"
set "SCOOP=%~dp0scoop"

:: get path for installed apps
cd scoop\apps
for /d %%D in (*) do (
	cd %%D
	call :loop
	cd ..
)

:: set final environment
set "CC=clang
set "CXX=clang++"
set "CFLAGS=--target=x86_64-windows-gnu"
set "CXXFLAGS=--target=x86_64-windows-gnu"
doskey clang=clang --target=x86_64-windows-gnu $*
doskey clang++=clang++ --target=x86_64-windows-gnu $*

:: final steps
cd %~dp0
cmd \k %~dp0scoop\shims\scoop.cmd  rem call scoop terminal
bash
goto :eof

:: set path
:concat 
set "VAR=%1"
if exist %1\bin set "VAR=%1\bin;%VAR%"
if exist %1\Scripts set "VAR=%1\Scripts;%VAR%"
if exist %1\libexec set "VAR=%1\libexec;%VAR%"
if exist "%1\perl\bin" set "VAR=%1\perl\bin;%VAR%"
set "PATH=%VAR%;%PATH%"
goto :eof

:: find final folder to get path of
:loop
for /d %%E in (*) do if NOT "%%E"=="current" call :concat %%~fE
goto :eof

