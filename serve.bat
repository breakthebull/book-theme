@echo off
echo ============================================
echo   Starting Jekyll Local Server
echo ============================================
echo.

cd /d "%~dp0"

if not exist "Gemfile" (
    echo [ERROR] Gemfile not found!
    pause
    exit /b 1
)

echo Starting Jekyll server...
echo.
echo Site will be available at: http://localhost:4000
echo.
echo Press Ctrl+C to stop the server.
echo.

REM Start Jekyll in background
start /B bundle exec jekyll serve

REM Wait 10 seconds for server to initialize
echo Waiting for server to start...
timeout /t 10 /nobreak

REM Open browser
start http://localhost:4000

echo.
echo [SUCCESS] Server started and browser opened!
echo.
echo Server is running in the background.
echo Close this window when you are done.
echo.
pause