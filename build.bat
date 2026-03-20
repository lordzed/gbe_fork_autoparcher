@echo off
echo ========================================
echo  gbe_fork Patcher - Build Script
echo ========================================
echo.

where python >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Python not found. Install from https://python.org
    pause
    exit /b 1
)

echo [1/3] Installing PyInstaller...
pip install pyinstaller --quiet

echo [2/3] Building exe...
pyinstaller --onefile --noconsole --name "gbe_fork_Patcher" ^
    --add-data "." ^
    patcher.py

echo.
if exist "dist\gbe_fork_Patcher.exe" (
    echo [3/3] SUCCESS! EXE is in the dist\ folder.
    echo       dist\gbe_fork_Patcher.exe
) else (
    echo [3/3] Build may have failed. Check output above.
)
echo.
pause
