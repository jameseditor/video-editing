@echo off
:: Navigate to Adobe's Unified Plugin Installer Agent directory
cd "C:\Program Files\Common Files\Adobe\Adobe Desktop Common\RemoteComponents\UPI\UnifiedPluginInstallerAgent"

:: Run the command to list all plugins
.\UnifiedPluginInstallerAgent /list all

:: Keep the console open for the user to review output
pause
