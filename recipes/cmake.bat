@setlocal enableextensions enabledelayedexpansion
set name=cmake
set MAVER=3
set MIVER=12
set REV=3
set VER=%MAVER%.%MIVER%.%REV%
echo %VER%
set packname=%name%-%VER%-win64-x64.zip
set URL="https://cmake.org/files/v%MAVER%.%MIVER%/%packname%"

:get
if not exist %packname% wget %URL%

:unpack
mkdir ..\install\%name%
7z x %packname% -o..\install
rename ..\install\%packname:~0,-4% %name%

:install
rem move "%packname:~0,-4%\*" "..\install\%name%"
rem cleanup
rem rmdir /s /q %packname:~0,-4%