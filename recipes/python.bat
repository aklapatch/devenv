
set name=python
set MAVER=3
set MIVER=7
set REV=0
set VER=%MAVER%.%MIVER%.%REV%
echo %VER%
set packname=%name%-%VER%-embed-amd64.zip
set URL="https://www.python.org/ftp/python/%VER%/python-%VER%-embed-amd64.zip"

:get
if not exist %packname% wget %URL%

:unpack
7z x %packname%

:install