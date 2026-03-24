@echo off
SETLOCAL
cd /d "%~dp0"

:: 1. 設定環境路徑
SET "NODE_EXE_PATH=%~dp0nodejs"
SET "GLOBAL_PATH=%~dp0node_global"
SET "PATH=%NODE_EXE_PATH%;%GLOBAL_PATH%;%PATH%"

:: 2. [移動版核心]：讓 OpenClaw 把設定存在這個資料夾裡，而不是電腦的 C 槽
SET "OPENCLAW_HOME=%~dp0config_data"
if not exist "%OPENCLAW_HOME%" mkdir "%OPENCLAW_HOME%"

:: 3. 執行
echo OpenClaw 移動版啟動中...
:: 第一次用請跑 onboard，之後直接跑 openclaw
pause
cmd /k