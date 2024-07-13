@echo off

echo Removing previous configuration
if exist "%USERPROFILE%\_vimrc"   del      "%USERPROFILE%\_vimrc"
if exist "%USERPROFILE%\_gvimrc"  del      "%USERPROFILE%\_gvimrc"
if exist "%USERPROFILE%\vimfiles" rd /S /Q "%USERPROFILE%\vimfiles"

echo Copying vim configuration
xcopy vim "%USERPROFILE%\vimfiles" /E /I /Y /Q > nul

echo Copying tig configuration
copy tigrc "%USERPROFILE%\.tigrc" > nul

pause
