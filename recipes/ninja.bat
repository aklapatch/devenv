@setlocal enableextensions enabledelayedexpansion
set name=ninja
set MAVER=1
set MIVER=8
set REV=2
set VER=%MAVER%.%MIVER%.%REV%
echo %VER%
set packname=%name%-win.zip
set URL="https://github.com/ninja-build/ninja/releases/download/v%VER%/%name%-win.zip"

:get
wget -nc %URL%

:unpack
mkdir ..\install\%name%
7z x %packname% -o..\install\%name%

:install
rem move "%packname:~0,-4%\*" "..\install\%name%"
rem cleanup
rem rmdir /s /q %packname:~0,-4%