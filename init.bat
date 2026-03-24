@echo off
SETLOCAL
cd /d "%~dp0"

:: 檢查 nodejs 資料夾是否存在
if not exist "%~dp0nodejs\node.exe" (
    echo [錯誤] 在 %~dp0nodejs 找不到 node.exe！
    echo 請確保你把下載的 ZIP 內容直接解壓到 nodejs 資料夾內。
    pause
    exit
)

:: 設定路徑
SET "NODE_EXE_PATH=%~dp0nodejs"
SET "GLOBAL_PATH=%~dp0node_global"

:: 設定環境變數 (只對當前視窗有效)
SET "PATH=%NODE_EXE_PATH%;%GLOBAL_PATH%;%PATH%"
SET "npm_config_prefix=%GLOBAL_PATH%"
SET "npm_config_cache=%~dp0node_cache"

echo ---------------------------------------------------
echo [環境檢查]
echo Node 版本: 
call node -v
echo NPM 版本: 
call npm -v
echo ---------------------------------------------------
echo 如果上方顯示版本號，請手動輸入以下指令進行安裝：
echo npm install -g openclaw@latest
echo ---------------------------------------------------
cmd /k