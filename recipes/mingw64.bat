
set name=mingw64
set MAVER=8
set MIVER=1
set REV=0
set VER=%MAVER%.%MIVER%.%REV%
set "packname=x86_64-%VER%-release-posix-seh-rt_v6-rev0.7z"
set "URL=https://sourceforge.net/projects/mingw-w64/files/Toolchains targetting Win64/Personal Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z"

:get
wget -nc "%URL%"

:unpack
for %%b in (%packname%) do (
	7z x %%b -o..\install\
)
:install