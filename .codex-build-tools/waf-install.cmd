@echo off
cd /d C:\ARDOURCUSTOM\ardour
if exist waf-install.exit del waf-install.exit
set "VSLANG=1033"
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
set "ARDOUR_VERSION=8.0.0"
set "ARDOUR_LLVM_NM=C:\Program Files\Unity\Hub\Editor\6000.3.10f1\Editor\Data\PlaybackEngines\WebGLSupport\BuildTools\Emscripten\llvm\llvm-nm.exe"
set "ARDOUR_ML64=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64\ml64.exe"
set "ARDOUR_PERL=C:\Program Files\Git\usr\bin\perl.exe"
set "PKG_CONFIG=C:\ARDOURCUSTOM\ardour\vcpkg\installed\x64-windows\tools\pkgconf\pkg-config.exe"
set "PKG_CONFIG_PATH=C:\ARDOURCUSTOM\ardour\vcpkg\installed\x64-windows\lib\pkgconfig"
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" > waf-install-env.out.log 2> waf-install-env.err.log
if errorlevel 1 (
  echo %ERRORLEVEL% > waf-install.exit
  exit /b %ERRORLEVEL%
)
"C:\Users\mattn\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" waf install > waf-install.out.log 2> waf-install.err.log
echo %ERRORLEVEL% > waf-install.exit
exit /b %ERRORLEVEL%
