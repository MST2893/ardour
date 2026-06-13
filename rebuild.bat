@echo off
:: Incremental rebuild desde C:\ArdourRemix\ardour (ruta renombrada desde ARDOURCUSTOM)
cd /d C:\ArdourRemix\ardour

if exist rebuild.exit del rebuild.exit

set "VSLANG=1033"
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
set "ARDOUR_VERSION=8.0.0"
set "ARDOUR_LLVM_NM=C:\Program Files\Unity\Hub\Editor\6000.3.10f1\Editor\Data\PlaybackEngines\WebGLSupport\BuildTools\Emscripten\llvm\llvm-nm.exe"
set "ARDOUR_ML64=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64\ml64.exe"
set "PKG_CONFIG=C:\ArdourRemix\ardour\vcpkg\installed\x64-windows\tools\pkgconf\pkg-config.exe"
set "PKG_CONFIG_PATH=C:\ArdourRemix\ardour\vcpkg\installed\x64-windows\lib\pkgconfig"

echo [1/3] Iniciando entorno MSVC 2022...
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" > rebuild-env.out.log 2> rebuild-env.err.log
if errorlevel 1 (
    echo ERROR: vcvars64.bat fallo. Ver rebuild-env.err.log
    pause
    exit /b 1
)

echo [2/3] Compilando (incremental)...
"C:\Users\mattn\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" waf build -j4 > rebuild.out.log 2> rebuild.err.log
set BUILD_EXIT=%ERRORLEVEL%
echo %BUILD_EXIT% > rebuild.exit

if %BUILD_EXIT% NEQ 0 (
    echo.
    echo BUILD FALLO - exit code: %BUILD_EXIT%
    echo.
    echo Ultimas lineas del log de error:
    powershell -NoProfile -Command "Get-Content 'rebuild.err.log' | Select-Object -Last 40"
    echo.
    pause
    exit /b %BUILD_EXIT%
)

echo [3/3] Instalando...
"C:\Users\mattn\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" waf install -j4 >> rebuild.out.log 2>> rebuild.err.log
set INSTALL_EXIT=%ERRORLEVEL%

if %INSTALL_EXIT% NEQ 0 (
    echo.
    echo WAF INSTALL FALLO - exit code: %INSTALL_EXIT%
    powershell -NoProfile -Command "Get-Content 'rebuild.err.log' | Select-Object -Last 20"
    pause
    exit /b %INSTALL_EXIT%
)

echo.
echo ========================================
echo BUILD E INSTALL OK - probando con run_debug.bat
echo ========================================
echo.
call run_debug.bat
