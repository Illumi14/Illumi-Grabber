@echo off
cd /d %~dp0
title Checking Python installation...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed! (Go to https://www.python.org/downloads and install the latest version.^)
    echo Make sure it is added to PATH.
    goto ERROR
)

title Checking libraries...
echo Checking 'dhooks' (1/4)
python -c "import dhooks" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing dhooks...
    python -m pip install dhooks > nul
)

title Checking libraries...
echo Checking 'customtkinter' (1/4)
python -c "import customtkinter" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing customtkinter...
    python -m pip install customtkinter > nul
)


cls
title Starting builder...
python builderHelper.py
if %errorlevel% neq 0 goto ERROR
exit

:ERROR
color 4 && title [Error]
pause > nul