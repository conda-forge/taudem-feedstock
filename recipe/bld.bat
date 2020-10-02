if "%ARCH%"=="32" (
    set PLATFORM=Win32
) else (
    set PLATFORM=x64
)

set TAUDEMVSDIR="Taudem5PCVS2015"

cd %TAUDEMVSDIR%

rem Setting Include/Lib paths
set "INCLUDE=%LIBRARY_INC%;%INCLUDE%"
set "LIB=%LIBRARY_LIB%;%LIB%"
set UseEnv=true

msbuild.exe /p:Platform=%PLATFORM% /p:Configuration=Release

for /r %SRC_DIR%\%TAUDEMVSDIR%\%PLATFORM%\Release %%f in (*.exe) do @copy "%%f" %LIBRARY_BIN%
for /r %SRC_DIR%\%TAUDEMVSDIR%\%PLATFORM%\Release %%f in (*.lib) do @copy "%%f" %LIBRARY_LIB%

dir /s /b
