if "%ARCH%"=="32" (
    set PLATFORM=Win32
) else (
    set PLATFORM=x64
)

cd Taudem5PCVS2015

msbuild.exe /p:Platform=%PLATFORM% /p:Configuration=Release

for /r %SRC_DIR%\out\Release-%PLATFORM%\bin %%f in (*.exe) do @copy "%%f" %LIBRARY_BIN%

dir /s /b
