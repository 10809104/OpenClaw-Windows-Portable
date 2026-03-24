# 🐾 OpenClaw Portable for Windows 🚀

> **"One Folder, Any Windows, Full AI Power."**

這是一個專為 Windows 使用者設計的 **OpenClaw (Open Source AI Automation Agent)** 行動版部署方案。透過自定義的環境導向腳本，實現 Node.js 與 OpenClaw 的完全隔離與可攜性，無需管理員權限即可在任何電腦上隨插即用。

> [英文說明文件 (Chinese Version)](https://github.com/10809104/OpenClaw-Windows-Portable/blob/main/README.md)

---

## 🌟 為什麼你需要這個？

* **零污染**：不改寫系統環境變數，不佔用 `%AppData%`。
* **全隔離**：Node.js 核心、npm 全域套件、API 設定檔全部鎖在一個資料夾內。
* **隨身帶**：放進隨身碟或雲端硬碟，換台電腦，點開即用。
* **開發者友善**：專為解決 Windows 上路徑衝突與權限問題（EPERM）而優化。

---

## 📂 資料夾結構建議

下載本倉庫腳本後，請依照以下結構擺放檔案：

```text
OpenClaw_Portable/
├── nodejs/               # [需自備] Node.js Prebuilt Binaries (ZIP 解壓後內容)
├── node_global/          # [自動產生] 存放 OpenClaw 程式本體
├── node_cache/           # [自動產生] npm 暫存檔
├── config_data/          # [自動產生] 存放你的 API Keys 與對話紀錄 (OPENCLAW_HOME)
├── init_env.bat          # 環境初始化與安裝腳本
└── Run_Claw.bat          # 日常啟動入口
```

---

## 🛠️ 快速開始 (3 步驟)

### 1. 準備 Node.js 環境
前往 [Node.js 官網](https://nodejs.org/) 下載 **Windows Binary (.zip)**，解壓縮後將內容物放入 `nodejs/` 資料夾中（確保 `node.exe` 就在 `nodejs/` 下）。

### 2. 初始化環境與安裝
右鍵以「管理員身分」執行 `init_env.bat`，在跳出的視窗輸入：
```powershell
npm install -g openclaw@latest
```

### 3. 配置與啟動
執行 `Run_Claw.bat`。第一次使用請輸入：
```powershell
openclaw onboard
```
完成 API Key 設定後，之後只需輸入 `openclaw gateway` 即可開始 AI 自動化之旅！

---

## 📜 核心腳本內容

### `init_env.bat` (環境初始化)
```batch
@echo off
SETLOCAL
cd /d "%~dp0"
if not exist "%~dp0nodejs\node.exe" (
    echo [Error] Please put node.exe into the /nodejs folder first!
    pause
    exit
)
SET "PATH=%~dp0nodejs;%~dp0node_global;%PATH%"
SET "npm_config_prefix=%~dp0node_global"
SET "npm_config_cache=%~dp0node_cache"
echo [Ready] Node version: 
call node -v
echo [Action] Run: npm install -g openclaw@latest
cmd /k
```

### `Run_Claw.bat` (移動版啟動器)
```batch
@echo off
cd /d "%~dp0"
SET "PATH=%~dp0nodejs;%~dp0node_global;%PATH%"
:: 強制將設定檔路徑導向資料夾內部，達成真正移動化
SET "OPENCLAW_HOME=%~dp0config_data"
echo Starting OpenClaw Portable Mode...
cmd /k
```

---

## ⚠️ 注意事項

* **API 安全**：你的金鑰會存在 `config_data/` 內，請勿將此資料夾上傳至公開 Repo。
* **依賴檢查**：若在新電腦執行時功能異常，請輸入 `openclaw doctor` 修復環境。

---

## 🤝 貢獻與支持

如果你覺得這個移動版配置幫到了你，請給一個 **Star ⭐**！
旨在讓 AI 自動化更簡單、更自由。
