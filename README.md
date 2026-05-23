# GitForge Toolkit

GitForge Toolkit 是一套可攜式的 Windows Batch 工具，用於快速建立 Git Repository、初始化 Git LFS，以及自動化管理 `.gitignore` 與 LFS 規則。

本工具特別適合：

- CAD 專案
- AI / LLM 專案
- Docker 專案
- Obsidian Vault
- 工程資料管理
- 大型檔案版本控制
- 本地知識庫管理

---

# 功能特色

## Git Repository 初始化

快速初始化 Git Repository：

```bat
git init
```

---

## Git LFS 初始化

快速啟用 Git LFS：

```bat
git lfs install
```

適合管理大型檔案：

- CAD
- PSD
- AI
- ZIP
- STEP
- SolidWorks
- PDF

---

## 外部化 LFS 規則管理

LFS 規則透過：

```plaintext
lfs_rules.ini
```

進行管理。

每一行代表一個規則：

```ini
*.psd
*.step
*.sldprt
*.zip
```

不需要修改 BAT 主程式。

---

## 外部化 .gitignore 管理

忽略規則透過：

```plaintext
gitignore_rules.ini
```

管理。

每一行代表一個忽略項目：

```ini
.vscode/
node_modules/
*.tmp
cache/
```

系統會自動產生：

```plaintext
.gitignore
```

---

## 一鍵完整初始化

可一次完成：

1. Git 初始化
2. Git LFS 初始化
3. 套用 LFS 規則
4. 建立 `.gitignore`

---

# 專案結構

```plaintext
GitForgeToolkit/
│
├─ GitForgeToolkit.bat
├─ lfs_rules.ini
├─ gitignore_rules.ini
└─ README.md
```

---

# 使用方式

## Step 1

下載專案。

---

## Step 2

將整個工具放入專案資料夾根目錄。

---

## Step 3

執行：

```plaintext
GitForgeToolkit.bat
```

---

# 主選單功能

```plaintext
1. 初始化 Git
2. 初始化 Git LFS
3. 套用 LFS 規則
4. Git + Git LFS 全套初始化
5. 查看 Git / LFS 狀態
6. 建立 .gitignore
7. 建立預設 INI 設定檔
0. 離開
```

---

# 適用情境

## CAD / 工程專案

適合管理：

- STEP
- DWG
- SolidWorks
- PSD
- AI

大型工程檔案。

---

## AI / LLM 專案

適合：

- Obsidian Vault
- LLM Wiki
- AI Agent Workspace
- Docker Workspace
- Python 專案

---

## 軟體開發專案

支援：

- Visual Studio
- VSCode
- Python
- Node.js
- Docker

---

# 為什麼使用外部規則檔？

相比將規則直接寫死在 BAT：

## 優點

- 更容易維護
- 更容易修改
- 更容易團隊協作
- 專案結構更乾淨
- 不需要修改主程式

---

# 系統需求

- Windows
- Git
- Git LFS

---

# 建議編碼設定

為避免 CMD 中文亂碼問題：

```plaintext
BAT 編碼：ANSI / Big5
Code Page：950
```

---

# 未來擴充方向

未來可擴充：

- GitHub API 整合
- Gitea API 整合
- 自動 Remote 設定
- 自動 Commit Template
- 專案類型 Profile
- PowerShell 版本
- GUI 圖形化版本

---

# License

MIT License
