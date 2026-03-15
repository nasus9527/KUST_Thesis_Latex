@echo off
setlocal

chcp 65001 >nul

set THESIS=main
set MODE=%1

if "%MODE%"=="" set MODE=thesis

if /I "%MODE%"=="thesis" goto :thesis
if /I "%MODE%"=="clean" goto :clean
if /I "%MODE%"=="cleanall" goto :cleanall
if /I "%MODE%"=="help" goto :help

echo [ERROR] Unknown option: %MODE%
echo.
goto :help

:check_latexmk
where latexmk >nul 2>nul
if errorlevel 1 (
  echo [ERROR] latexmk not found in PATH.
  echo         Please check TeX Live installation and PATH settings.
  exit /b 1
)
exit /b 0

:thesis
call :check_latexmk
if errorlevel 1 exit /b 1
echo [INFO] Compile thesis with XeLaTeX + Biber pipeline...
latexmk -xelatex -synctex=1 -file-line-error -halt-on-error -interaction=nonstopmode %THESIS%.tex
if errorlevel 1 (
  echo.
  echo [ERROR] Build failed. Please check %THESIS%.log for details.
  exit /b 1
)
echo [INFO] Clean auxiliary files and keep PDF + SyncTeX...
latexmk -c %THESIS%.tex
echo.
echo [OK] Build finished: %THESIS%.pdf
exit /b 0

:clean
call :check_latexmk
if errorlevel 1 exit /b 1
echo [INFO] Clean auxiliary files...
latexmk -c %THESIS%.tex
exit /b 0

:cleanall
call :check_latexmk
if errorlevel 1 exit /b 1
echo [INFO] Clean all generated files (including PDF)...
latexmk -C %THESIS%.tex
exit /b 0

:help
echo Compile.bat - KUST thesis quick build script
echo.
echo Usage:
echo   Compile.bat [option]
echo.
echo Options:
echo   thesis    Compile thesis (default)
echo   clean     Remove auxiliary files
echo   cleanall  Remove all generated files including PDF
echo   help      Show this help message
echo.
echo Examples:
echo   Compile.bat
echo   Compile.bat thesis
echo   Compile.bat clean
echo   Compile.bat cleanall
exit /b 0
