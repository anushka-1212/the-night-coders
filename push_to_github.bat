@echo off
setlocal enabledelayedexpansion

:: Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Error: Git is not installed. Please install Git first.
    exit /b 1
)

:: Initialize git if not already initialized
if not exist .git (
    echo Initializing git repository...
    git init
)

:: Add all files to staging
echo Adding files to staging...
git add .

:: Get commit message from user
set /p COMMIT_MESSAGE="Enter commit message: "

:: Commit changes
echo Committing changes...
git commit -m "%COMMIT_MESSAGE%"

:: Check if remote origin exists
git remote | findstr "origin" >nul
if %ERRORLEVEL% neq 0 (
    set /p REPO_URL="Enter GitHub repository URL (e.g., https://github.com/username/repo.git): "
    git remote add origin "%REPO_URL%"
)

:: Push to GitHub
echo Pushing to GitHub...
git push -u origin main

:: Check if push was successful
if %ERRORLEVEL% equ 0 (
    echo Successfully pushed to GitHub!
) else (
    echo Error: Failed to push to GitHub. Please check your credentials and try again.
    exit /b 1
) 