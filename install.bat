@echo off

echo Copying vimrc ...
copy vimrc  "%USERPROFILE%\_vimrc" > nul
copy gvimrc "%USERPROFILE%\_gvimrc" > nul

echo Copying vimfiles ...
if exist "%USERPROFILE%\vimfiles" rd /S /Q "%USERPROFILE%\vimfiles"
xcopy vim "%USERPROFILE%\vimfiles" /E /I /Y /Q > nul

pause
