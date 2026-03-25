@echo off
echo ============================================
echo   Building Jekyll Site...
echo ============================================

bundle exec jekyll build

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Build failed! Check the messages above.
    pause
    exit /b %errorlevel%
)

echo.
echo [SUCCESS] Site built in _site/ folder!
echo.
pause