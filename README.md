# GitForge Toolkit

GitForge Toolkit is a portable Windows Batch toolkit for quickly initializing Git repositories with Git LFS support and customizable `.gitignore` management.

This toolkit is designed for:

- Git Repository Initialization
- Git LFS Initialization
- Externalized LFS Rules
- Externalized `.gitignore` Rules
- Portable Project Bootstrap
- Engineering / CAD / AI / LLM Workspace Setup

---

# Features

## Git Initialization

Automatically initialize local Git repositories.

```bat
git init
```

---

## Git LFS Initialization

Initialize Git LFS support for large file version control.

```bat
git lfs install
```

---

## External LFS Rule Management

LFS tracking rules are managed through:

```plaintext
lfs_rules.ini
```

Each line represents one tracking rule:

```ini
*.psd
*.step
*.sldprt
*.zip
```

No need to modify the BAT file directly.

---

## External .gitignore Management

Ignore rules are managed through:

```plaintext
gitignore_rules.ini
```

Each line represents one ignore rule:

```ini
.vscode/
node_modules/
*.tmp
cache/
```

The toolkit automatically generates:

```plaintext
.gitignore
```

---

## One-Click Full Initialization

Complete setup process:

1. Initialize Git
2. Initialize Git LFS
3. Apply LFS Rules
4. Generate `.gitignore`

---

# Project Structure

```plaintext
GitForgeToolkit/
│
├─ GitForgeToolkit.bat
├─ lfs_rules.ini
├─ gitignore_rules.ini
└─ README.md
```

---

# Usage

## Step 1

Download the project.

---

## Step 2

Place the toolkit into your project folder.

---

## Step 3

Run:

```plaintext
GitForgeToolkit.bat
```

---

# Menu

```plaintext
1. Initialize Git
2. Initialize Git LFS
3. Apply LFS Rules
4. Full Initialization
5. View Git/LFS Status
6. Generate .gitignore
7. Generate Default INI Files
0. Exit
```

---

# Example Use Cases

## CAD Projects

Supports large engineering files:

- STEP
- SolidWorks
- DWG
- AI
- PSD

---

## AI / LLM Projects

Useful for:

- Obsidian Vaults
- LLM Wiki
- AI Agent Workspaces
- Docker Projects
- Python Environments

---

## Software Development

Supports:

- Visual Studio
- VSCode
- Node.js
- Python
- Docker

---

# Why External Rule Files?

Instead of hardcoding rules inside BAT scripts:

- Easier maintenance
- Easier customization
- Easier team collaboration
- Cleaner project structure

---

# Requirements

- Windows
- Git
- Git LFS

---

# Recommended Encoding

For best compatibility:

```plaintext
BAT Encoding : ANSI / Big5
Code Page    : 950
```

---

# Future Plans

Possible future expansions:

- GitHub API Integration
- Gitea API Integration
- Auto Remote Setup
- Auto Commit Templates
- Project Profiles
- PowerShell Edition
- GUI Edition

---

# License

MIT License