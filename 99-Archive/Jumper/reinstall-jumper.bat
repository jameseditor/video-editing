@echo off
:: Navigate to Adobe's Unified Plugin Installer Agent directory
cd "C:\Program Files\Common Files\Adobe\Adobe Desktop Common\RemoteComponents\UPI\UnifiedPluginInstallerAgent"

pause

:: Install the Jumper.zxp plugin
.\UnifiedPluginInstallerAgent /install "C:\Program Files (x86)\Jumper\_internal\Jumper.zxp"

:: Confirm completion
echo Plugin installation complete.
pause
