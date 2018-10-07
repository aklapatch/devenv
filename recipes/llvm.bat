@setlocal enableextensions enabledelayedexpansion
set name=llvm
set MAVER=7
set MIVER=0
set REV=0
set VER=%MAVER%.%MIVER%.%REV%
echo %VER%
set packname=LLVM-%VER%-win64.exe
set URL="http://releases.llvm.org/%VER%/%packname%"

:get
wget -nc %URL%

:unpack
7z x %packname% -o..\install\%name%

:install
rem move "%packname:~0,-4%\*" "..\install\%name%"
rem cleanup
rem rmdir /s /q %packname:~0,-4%