
set name=nodejs
set MAVER=10
set MIVER=11
set REV=0
set VER=%MAVER%.%MIVER%.%REV%
echo %VER%
set packname=node-v%VER%-win-x64.zip
set URL="https://nodejs.org/dist/v%VER%/%packname%"

:get
wget -nc %URL%

:unpack
7z x %packname%

:install
move %packname:~0,-4% ..\install\%name%


