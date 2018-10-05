@setlocal enableextensions enabledelayedexpansion
set name=git
set MAVER=2
set MIVER=19
set REV=0
set VER=%MAVER%.%MIVER%.%REV%
echo %VER%
set packname=PortableGit-%VER%-64-bit.7z.exe
set URL="https://github.com/git-for-windows/git/releases/download/v%VER%.windows.1/PortableGit-%VER%-64-bit.7z.exe"

:get
if not exist %packname% wget %URL%

:unpack
mkdir ..\install\%name%
7z x %packname% -o..\install\%name%

:install
call ..\install\%name%\post-install.bat