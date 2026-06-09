@echo off
cd /d C:\ARDOURCUSTOM\ardour
if exist waf-compile-commands.exit del waf-compile-commands.exit
set "VSLANG=1033"
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
set "ARDOUR_VERSION=8.0.0"
set "ARDOUR_LLVM_NM=C:\Program Files\Unity\Hub\Editor\6000.3.10f1\Editor\Data\PlaybackEngines\WebGLSupport\BuildTools\Emscripten\llvm\llvm-nm.exe"
set "ARDOUR_ML64=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64\ml64.exe"
set "ARDOUR_PERL=C:\Program Files\Git\usr\bin\perl.exe"
set "PKG_CONFIG=C:\ARDOURCUSTOM\ardour\vcpkg\installed\x64-windows\tools\pkgconf\pkg-config.exe"
set "PKG_CONFIG_PATH=C:\ARDOURCUSTOM\ardour\vcpkg\installed\x64-windows\lib\pkgconfig"
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" > waf-compile-commands-env.out.log 2> waf-compile-commands-env.err.log
if errorlevel 1 (
  echo %ERRORLEVEL% > waf-compile-commands.exit
  exit /b %ERRORLEVEL%
)
"C:\Users\mattn\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" waf configure --compile-database --dist-target=msvc --check-c-compiler=msvc --check-cxx-compiler=msvc --prefix=C:/ARDOURCUSTOM/ardour/_install --program-name=Ardour --with-backends=dummy,jack,portaudio --boost-include=C:/ARDOURCUSTOM/ardour/vcpkg/installed/x64-windows/include --also-include=C:/ARDOURCUSTOM/ardour/vcpkg/installed/x64-windows/include --also-libdir=C:/ARDOURCUSTOM/ardour/vcpkg/installed/x64-windows/lib --optimize --cxx17 --internal-shared-libs --noconfirm > waf-compile-commands-configure.out.log 2> waf-compile-commands-configure.err.log
if errorlevel 1 (
  echo %ERRORLEVEL% > waf-compile-commands.exit
  exit /b %ERRORLEVEL%
)
if exist build\compile_commands.json del build\compile_commands.json
"C:\Users\mattn\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" waf build --compile-database --targets=__compile_commands_only__ > waf-compile-commands.out.log 2> waf-compile-commands.err.log
set "WAF_STATUS=%ERRORLEVEL%"
if exist build\compile_commands.json (
  echo 0 > waf-compile-commands.exit
  exit /b 0
)
echo %WAF_STATUS% > waf-compile-commands.exit
exit /b %WAF_STATUS%
