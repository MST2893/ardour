@echo off
setlocal enabledelayedexpansion

set "ARDOUR_ROOT=C:\ArdourRemix\ardour"
set "ARDOUR_INSTALL=%ARDOUR_ROOT%\_install"
set "ARDOUR_EXE=%ARDOUR_INSTALL%\lib\ardour8\ardour-8.0.0.exe"

cd /d "%ARDOUR_ROOT%"

:: Timestamp via PowerShell (wmic deprecado en Win11)
for /f %%T in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set TS=%%T

set "OUTLOG=%ARDOUR_ROOT%\ardour_stdout_%TS%.txt"
set "ERRLOG=%ARDOUR_ROOT%\ardour_stderr_%TS%.txt"

:: Habilitar crash dumps locales para el exe
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting\LocalDumps\ardour-8.0.0.exe" /v DumpFolder /t REG_EXPAND_SZ /d "%ARDOUR_ROOT%" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting\LocalDumps\ardour-8.0.0.exe" /v DumpType  /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting\LocalDumps\ardour-8.0.0.exe" /v DumpCount /t REG_DWORD /d 5 /f >nul 2>&1

:: Variables de entorno requeridas por Ardour
set "ARDOUR_DATA_PATH=%ARDOUR_INSTALL%\share\ardour8"
set "ARDOUR_CONFIG_PATH=%ARDOUR_INSTALL%\etc\ardour8"
set "ARDOUR_DLL_PATH=%ARDOUR_INSTALL%\lib\ardour8"
set "VAMP_PATH=%ARDOUR_INSTALL%\lib\ardour8\vamp"
set "GTK_PATH=%ARDOUR_INSTALL%\etc\ardour8;%ARDOUR_INSTALL%\lib\ardour8"
set "PATH=%ARDOUR_INSTALL%\lib\ardour8;%ARDOUR_INSTALL%\bin;%PATH%"
set "UBUNTU_MENUPROXY="

echo Ardour Debug Run %TS% > "%OUTLOG%"
echo EXE: %ARDOUR_EXE% >> "%OUTLOG%"
echo. >> "%OUTLOG%"

echo [%TS%] Iniciando Ardour... > "%ERRLOG%"
echo EXE: %ARDOUR_EXE% >> "%ERRLOG%"
echo. >> "%ERRLOG%"

if not exist "%ARDOUR_EXE%" (
    echo ERROR: No se encontro el ejecutable:
    echo   %ARDOUR_EXE%
    pause
    exit /b 1
)

echo Lanzando: %ARDOUR_EXE%
echo Logs: %OUTLOG%
echo       %ERRLOG%
echo.

"%ARDOUR_EXE%" >> "%OUTLOG%" 2>> "%ERRLOG%"
set EXIT_CODE=%ERRORLEVEL%

echo. >> "%ERRLOG%"
echo [FIN] Exit code: %EXIT_CODE% >> "%ERRLOG%"

echo.
echo ----------------------------------------
if %EXIT_CODE% NEQ 0 (
    echo ARDOUR TERMINO CON ERROR - exit code: %EXIT_CODE%
    echo.
    echo Ultimas lineas del stderr:
    powershell -NoProfile -Command "Get-Content '%ERRLOG%' | Select-Object -Last 25"
    echo.
    echo Crash dumps encontrados:
    dir "%ARDOUR_ROOT%\*.dmp" 2>nul || echo Ninguno.
) else (
    echo Ardour cerro normalmente - exit code: 0
)
echo ----------------------------------------
echo.
pause
endlocal
