@echo off
chcp 950 >nul
title Git + Git LFS 初始化工具

cd /d "%~dp0"

set LFS_RULE_FILE=lfs_rules.ini
set GITIGNORE_RULE_FILE=gitignore_rules.ini

:MENU
cls
echo ==========================================
echo Git + Git LFS 初始化工具
echo ==========================================
echo 目前資料夾：
echo %cd%
echo ==========================================
echo.
echo 1. 初始化 Git
echo 2. 初始化 Git LFS
echo 3. 依 lfs_rules.ini 設定 LFS 追蹤規則
echo 4. 執行 Git + Git LFS 全套初始化
echo 5. 查看目前 Git / LFS 狀態
echo 6. 依 gitignore_rules.ini 建立 .gitignore
echo 7. 建立預設 INI 設定檔
echo 0. 離開
echo.
set /p choice=請選擇：

if "%choice%"=="1" goto INIT_GIT
if "%choice%"=="2" goto INIT_LFS
if "%choice%"=="3" goto TRACK_LFS
if "%choice%"=="4" goto INIT_ALL
if "%choice%"=="5" goto STATUS
if "%choice%"=="6" goto GITIGNORE
if "%choice%"=="7" goto CREATE_DEFAULT_INI
if "%choice%"=="0" goto END

echo.
echo 無效的選項！
pause
goto MENU


:INIT_GIT
cls
echo [初始化 Git]
echo.

if exist ".git" (
    echo 此資料夾已經是 Git Repository。
) else (
    git init
    if errorlevel 1 (
        echo Git 初始化失敗！
    ) else (
        echo Git 初始化成功！
        echo 已建立 .git 資料夾
    )
)

echo.
pause
goto MENU


:INIT_LFS
cls
echo [初始化 Git LFS]
echo.

git lfs version
if errorlevel 1 (
    echo 找不到 Git LFS，請先安裝 Git LFS。
    echo.
    pause
    goto MENU
)

git lfs install
if errorlevel 1 (
    echo Git LFS 初始化失敗！
) else (
    echo Git LFS 初始化成功！
)

echo.
pause
goto MENU


:TRACK_LFS
cls
echo [依 lfs_rules.ini 設定 LFS 追蹤規則]
echo.

call :TRACK_LFS_NO_PAUSE

echo.
pause
goto MENU


:INIT_ALL
cls
echo [Git + Git LFS 全套初始化]
echo.
set /p confirm=是否繼續？Y/N：

if /i not "%confirm%"=="Y" goto MENU

echo.
echo [1/4] 初始化 Git...

if exist ".git" (
    echo Git 已初始化，略過 git init。
) else (
    git init
    if errorlevel 1 (
        echo Git 初始化失敗！
        pause
        goto MENU
    ) else (
        echo Git 初始化成功！
    )
)

echo.
echo [2/4] 初始化 Git LFS...

git lfs version
if errorlevel 1 (
    echo 找不到 Git LFS！
    pause
    goto MENU
)

git lfs install
if errorlevel 1 (
    echo Git LFS 初始化失敗！
    pause
    goto MENU
) else (
    echo Git LFS 初始化成功！
)

echo.
echo [3/4] 設定 LFS 追蹤規則...
call :TRACK_LFS_NO_PAUSE

echo.
echo [4/4] 建立 .gitignore...
call :CREATE_GITIGNORE_NO_PAUSE

echo.
echo Git + Git LFS 全套初始化完成！
echo.
pause
goto MENU


:TRACK_LFS_NO_PAUSE
if not exist "%LFS_RULE_FILE%" (
    echo 找不到 %LFS_RULE_FILE%
    echo 請先選擇 7 建立預設 INI 設定檔。
    exit /b
)

for /f "usebackq tokens=* delims=" %%A in ("%LFS_RULE_FILE%") do (
    if not "%%A"=="" (
        echo 套用 LFS 規則：%%A
        git lfs track "%%A"
    )
)

git add .gitattributes

echo.
echo LFS 追蹤規則設定完成！
echo 已更新 .gitattributes
exit /b


:STATUS
cls
echo [Git / LFS 狀態]
echo.

echo ---------- Git Status ----------
git status

echo.
echo ---------- Git LFS Track ----------
git lfs track

echo.
pause
goto MENU


:GITIGNORE
cls
echo [依 gitignore_rules.ini 建立 .gitignore]
echo.

call :CREATE_GITIGNORE_NO_PAUSE

echo.
pause
goto MENU


:CREATE_GITIGNORE_NO_PAUSE
if not exist "%GITIGNORE_RULE_FILE%" (
    echo 找不到 %GITIGNORE_RULE_FILE%
    echo 請先選擇 7 建立預設 INI 設定檔。
    exit /b
)

copy /y "%GITIGNORE_RULE_FILE%" ".gitignore" >nul

echo .gitignore 建立完成！
echo 來源檔案：%GITIGNORE_RULE_FILE%
exit /b


:CREATE_DEFAULT_INI
cls
echo [建立預設 INI 設定檔]
echo.

if not exist "%LFS_RULE_FILE%" (
    (
    echo *.zip
    echo *.7z
    echo *.rar
    echo *.pdf
    echo *.pptx
    echo *.psd
    echo *.ai
    echo *.step
    echo *.stp
    echo *.dwg
    echo *.sldprt
    echo *.sldasm
    ) > "%LFS_RULE_FILE%"
    echo 已建立 %LFS_RULE_FILE%
) else (
    echo %LFS_RULE_FILE% 已存在，略過建立。
)

if not exist "%GITIGNORE_RULE_FILE%" (
    (
    echo Thumbs.db
    echo Desktop.ini
    echo *.tmp
    echo *.temp
    echo ~$*
    echo *.log
    echo __pycache__/
    echo *.pyc
    echo .vscode/
    echo .vs/
    echo bin/
    echo obj/
    echo node_modules/
    echo .obsidian/workspace.json
    echo .obsidian/cache/
    echo .idea/
    echo cache/
    echo temp/
    echo tmp/
    echo output/
    echo export/
    echo .DS_Store
    ) > "%GITIGNORE_RULE_FILE%"
    echo 已建立 %GITIGNORE_RULE_FILE%
) else (
    echo %GITIGNORE_RULE_FILE% 已存在，略過建立。
)

echo.
pause
goto MENU


:END
cls
echo 程式結束
echo.
pause
exit /b