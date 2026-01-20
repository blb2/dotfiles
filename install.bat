@echo off

echo Removing previous configuration
if exist "%USERPROFILE%\_vimrc"      del      "%USERPROFILE%\_vimrc"
if exist "%USERPROFILE%\_gvimrc"     del      "%USERPROFILE%\_gvimrc"
if exist "%USERPROFILE%\vimfiles"    rd /S /Q "%USERPROFILE%\vimfiles"
if exist "%USERPROFILE%\.config\vim" rd /S /Q "%USERPROFILE%\.config\vim"

if not exist "%USERPROFILE%\.config" mkdir "%USERPROFILE%\.config"

echo Copying vim configuration
xcopy vim "%USERPROFILE%\vimfiles"    /E /I /Y /Q > nul
xcopy vim "%USERPROFILE%\.config\vim" /E /I /Y /Q > nul

echo Copying tig configuration
copy tigrc "%USERPROFILE%\.tigrc" > nul

pause
