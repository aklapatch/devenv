

set name=7zip
set MAVER=18
set MIVER=05
set REV=
set VER=%MAVER%%MIVER%
set "TMP=%~dp07zip"
echo %VER%
set packname=7z%VER%-x64.msi
set finalname=7z.exe
set URL="https://www.7-zip.org/a/%packname%"
set "DEST=%~dp0..\"
call :resolve %DEST% FIN
call :%*

:get
if not exist %~dp0%packname% wget %URL%
goto :unpack

:resolve
set "%~2=%~f1"
goto :eof

:unpack
if not exist ..\7zip (
msiexec /a %packname% /qb TARGETDIR=%TMP%
)
goto :install

:install
robocopy /s %TMP%\Files %FIN% 
rmdir /s /q %~dp07zip
goto :eof

:remove
rmdir /s /q %FIN%7zip
goto :eof

:purge
del %packname%
goto :eof