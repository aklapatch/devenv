::@echo off
SETLOCAL EnableDelayedExpansion

set "VSCODEDIR=%~dp0vscodium\"
set "MSYSDir=%~dp0msys64\"
set "AuxDir=%~dp0grabber\root\"

set "ToolsDirs=%MSYSDir%mingw64\bin;%MSYSDir%usr\bin;%AuxDir%;%AuxDir%bin

:: extend the path to include an auxiliary location (msys and tools dir)
set "PATH=%ToolsDirs%;%PATH%"

:: change extension dir and settings dir
cd %~dp0
start %VSCODEDIR%VSCodium.exe --user-data-dir "%VSCODEDIR%settings" --extensions-dir "%VSCODEDIR%extensions"

goto :eof