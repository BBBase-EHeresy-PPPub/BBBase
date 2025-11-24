@echo off
echo Starting Blood Bowl Base...
echo.

:: Clean everything
mike delete --all >nul 2>&1
if exist site rmdir /s /q site >nul 2>&1

mike deploy --config-file mkdocs-2020.yml bb2020
mike deploy --config-file mkdocs-2025.yml bb2025

mike set-default --config-file mkdocs-2020.yml bb2025

echo.
echo ================================================
echo Site is ready!
echo   http://127.0.0.1:8000/        - Blood Bowl 2020 (default)
echo ================================================
echo.
mike serve
