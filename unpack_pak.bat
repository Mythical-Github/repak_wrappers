@echo off
setlocal enabledelayedexpansion

cd %~dp0

set repak_exe="%CD%\repak.exe"

for /f "tokens=1,* delims==" %%A in (settings.ini) do (
    if "%%A"=="compression_type" set compression_type=%%B
    if "%%A"=="pak_version" set pak_version=%%B
    if "%%A"=="aes_key" set aes_key=%%B
)

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
