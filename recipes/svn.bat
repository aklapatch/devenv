@setlocal enableextensions enabledelayedexpansion
set name=svn
set MAVER=1
set MIVER=10
set REV=1
set VER=%MAVER%.%MIVER%.%REV%
echo %VER%
set packname=TortoiseSVN-%VER%.28295-x64-svn-1.10.2.msi
set URL="https://osdn.net/projects/tortoisesvn/storage/%VER%/Application/%packname%"

:get
wget --no-check-certificate -nc %URL%

:unpack
set "instdir=..\install\%name%"
call :resolve "%instdir%" instdir
msiexec /a %packname% /qb TARGETDIR=%~dp0\%name%

:install
move "%name%\Program Files\TortoiseSVN" ..\install\%name%
rmdir /s /q %name%
goto :EOF

:resolve
set "%~2=%~f1"
goto :EOF
