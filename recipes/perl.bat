@setlocal enableextensions enabledelayedexpansion
set name=perl
set MAVER=5
set MIVER=28
set REV=0
set VER=%MAVER%.%MIVER%.%REV%.1
echo %VER%
set packname=strawberry-%name%-%VER%-64bit.zip
set URL="http://strawberryperl.com/download/5.28.0.1/%packname%"

:get
if not exist %packname% wget %URL%

:unpack
7z x %packname% -o..\install\%name%

:install
rem move "%packname:~0,-4%\*" "..\install\%name%"
rem cleanup
rem rmdir /s /q %packname:~0,-4%