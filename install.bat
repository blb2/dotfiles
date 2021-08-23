@echo off

echo Copying vim configuration
copy vimrc  "%USERPROFILE%\_vimrc" > nul
copy gvimrc "%USERPROFILE%\_gvimrc" > nul
if exist "%USERPROFILE%\vimfiles" rd /S /Q "%USERPROFILE%\vimfiles"
xcopy vim "%USERPROFILE%\vimfiles" /E /I /Y /Q > nul

pause
