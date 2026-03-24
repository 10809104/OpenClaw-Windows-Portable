# 🐾 OpenClaw Portable for Windows 🚀

> **"One Folder, Any Windows, Full AI Power."**

This is a specialized **Portable Deployment Solution** for **OpenClaw (Open Source AI Automation Agent)** on Windows. Using customized environment-routing scripts, it achieves complete isolation of Node.js and OpenClaw, enabling a plug-and-play experience on any machine without modifying system-wide settings.

> [中文說明文件 (Chinese Version)](https://github.com/10809104/OpenClaw-Windows-Portable/README_ZH.md)
-----

## 🌟 Why Use This?

  * **Zero Pollution**: No changes to system environment variables; no files left in `%AppData%`.
  * **Total Isolation**: Node.js core, global npm packages, and API configurations are all contained within a single directory.
  * **True Portability**: Carry it on a USB drive or cloud storage. Just plug it in and start working on any PC.
  * **Developer-First**: Specifically optimized to solve common Windows path conflicts and permission issues (`EPERM`).

-----

## 📂 Recommended Directory Structure

After downloading the scripts from this repo, please organize your files as follows:

```text
OpenClaw_Portable/
├── nodejs/               # [Required] Node.js Prebuilt Binaries (unzipped content)
├── node_global/          # [Auto-generated] Stores OpenClaw binary and packages
├── node_cache/           # [Auto-generated] npm cache files
├── config_data/          # [Auto-generated] Stores API Keys and logs (OPENCLAW_HOME)
├── init_env.bat          # Environment initialization and installation script
└── Run_Claw.bat          # Daily launcher for portable mode
```

-----

## 🛠️ Quick Start (3 Steps)

### 1\. Prepare Node.js Environment

Go to the [Node.js Official Website](https://nodejs.org/) and download the **Windows Binary (.zip)**. Extract the contents into the `nodejs/` folder (ensure `node.exe` is directly under `nodejs/`).

### 2\. Initialize and Install

Right-click `init_env.bat` and select **"Run as Administrator"**. In the terminal, type:

```powershell
npm install -g openclaw@latest
```

### 3\. Configure and Launch

Run `Run_Claw.bat`. For first-time setup, type:

```powershell
openclaw onboard
```

Once your API Keys are configured, simply type `openclaw` in the future to start your AI automation journey\!

-----

## 📜 Core Scripts

### `init_env.bat` (Environment Init)

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

### `Run_Claw.bat` (Portable Launcher)

```batch
@echo off
cd /d "%~dp0"
SET "PATH=%~dp0nodejs;%~dp0node_global;%PATH%"
:: Force config redirection for true portability
SET "OPENCLAW_HOME=%~dp0config_data"
echo Starting OpenClaw Portable Mode...
cmd /k
```

-----

## ⚠️ Important Notes

  * **API Security**: Your sensitive keys are stored in `config_data/`. **DO NOT** upload this folder to any public repository.
  * **Dependency Check**: If features fail on a new machine, run `openclaw doctor` to diagnose and fix the environment.

-----

## 🤝 Contribution & Support

If this portable setup helped you, please give it a **Star ⭐**\!
Making AI automation simpler, freer, and truly mobile.

-----

