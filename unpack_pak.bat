@echo off
setlocal enabledelayedexpansion

cd %~dp0

set repak_exe="%CD%\repak.exe"

if "%~1"=="" (
    echo No file dropped. Please drag and drop a pak file onto this batch file.
    pause
    exit /b
)

for %%A in ("%~1") do (
    set "pak_filename=%%~nA"
)

if exist "%pak_filename%" (
    echo Deleting existing directory: %pak_filename%
    rd /s /q "%pak_filename%"
)

%repak_exe% unpack "%~1"

exit /b
