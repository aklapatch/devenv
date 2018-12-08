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

:: final steps
cd %~dp0
set "PATH=%PATH%;%~dp0scoop\shims\
mingw64
goto :eof

:: set path
:concat 
set "VAR=%1"
if exist %1\mingw64\bin set "VAR=%1\mingw64\bin;%VAR%"
if exist %1\usr\bin set "VAR=%1\usr\bin;%VAR%"
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

