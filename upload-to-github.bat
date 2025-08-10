@echo off
echo.
echo ========================================
echo   Claude AI Agents - GitHub Upload
echo ========================================
echo.
echo Please enter your GitHub username:
set /p username=

echo.
echo Creating GitHub repository connection...
git remote add origin https://github.com/%username%/claude-ai-agents.git

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ========================================
echo   Upload Complete!
echo ========================================
echo.
echo Your repository is now available at:
echo https://github.com/%username%/claude-ai-agents
echo.
pause