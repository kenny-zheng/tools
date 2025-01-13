@echo off

:: Get all directories in the current folder
echo Current directories:
for /d %%D in (*) do (
    echo %%D
)

:: Prompt user to input folder name, default is DefaultFolder
set /p FOLDER_NAME="Please enter the folder name to copy (default: DefaultFolder): "
if "%FOLDER_NAME%"=="" (
    set FOLDER_NAME=DefaultFolder
)

:: Check if a folder name was provided
if "%FOLDER_NAME%"=="" (
    echo Please provide a folder name.
    exit /b 1
)

set PROJECT_PATH=%FOLDER_NAME%
set DESTINATION=SourceCode

:: Create SourceCode folder if it doesn't exist
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

:: Copy source code to SourceCode folder, excluding bin and obj folders
xcopy "%PROJECT_PATH%\*" "%DESTINATION%\" /E /I /EXCLUDE:bin\*;obj\* /Y

echo Source code has been successfully copied to %DESTINATION% folder.
pause