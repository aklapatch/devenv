
set name=geany
set MAVER=1
set MIVER=33
set REV=
set VER=%MAVER%.%MIVER%
set "packname=%name%-%VER%_setup.exe %name%-plugins-%VER%_setup.exe"
set "URL=http://download.geany.org/%name%-%VER%_setup.exe https://plugins.geany.org/geany-plugins/geany-plugins-%VER%_setup.exe"

:get
for %%a in (%URL%) do (
	wget -nc %%a
)

:unpack
for %%b in (%packname%) do (
	7z x %%b -o..\install\%name%
)
:install