@echo off
SETLOCAL EnableDelayedExpansion
cd /d "%~dp0"

:: 1. 環境設定
SET "NODE_EXE_PATH=%~dp0nodejs"
SET "GLOBAL_PATH=%~dp0node_global"
SET "PATH=%NODE_EXE_PATH%;%GLOBAL_PATH%;%PATH%"
SET "OPENCLAW_HOME=%~dp0config_data"

:: 2. [核心功能] 自動修正 JSON 裡面的 Workspace 路徑
SET "JSON_FILE=%~dp0config_data\.openclaw\openclaw.json"

if exist "%JSON_FILE%" (
    echo [Portable] Syncing workspace path...
    
    :: 取得當前資料夾路徑，並將 \ 換成 \\ 以符合 JSON 格式
    SET "RAW_CUR=%~dp0config_data\.openclaw\workspace"
    SET "FIXED_CUR=!RAW_CUR:\=\\!"
    
    :: 使用 PowerShell 讀取並替換 workspace 欄位
    powershell -Command "$json = Get-Content '%JSON_FILE%' | ConvertFrom-Json; $json.agents.defaults.workspace = '!FIXED_CUR!'; $json | ConvertTo-Json -Depth 100 | Set-Content '%JSON_FILE%'"
    
    echo [Portable] Path updated to current directory.
)

:: 3. 啟動
echo Starting OpenClaw...
cmd /k
