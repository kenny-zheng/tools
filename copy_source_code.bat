@echo off

:: Get all directories in the current folder
echo Current directories:
setlocal enabledelayedexpansion
set count=0

for /d %%D in (*) do (
    set /a count+=1
    echo !count! - %%D
    set "folder[!count!]=%%D"
)

:: Prompt user to input folder number
set /p FOLDER_INDEX="Please enter the folder number to copy: "

:: Check if a valid number was provided
if "!folder[%FOLDER_INDEX%]!"=="" (
    echo Please provide a valid folder number.
    exit /b 1
)

set PROJECT_PATH=!folder[%FOLDER_INDEX%]!
set DESTINATION=SourceCode

:: Create SourceCode folder if it doesn't exist
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

:: Copy source code to SourceCode folder, including all subfolders
xcopy "%PROJECT_PATH%\*" "%DESTINATION%\" /E /I /Y

:: Delete bin and obj folders if they exist
if exist "%DESTINATION%\bin" (
    rmdir /S /Q "%DESTINATION%\bin"
)

if exist "%DESTINATION%\obj" (
    rmdir /S /Q "%DESTINATION%\obj"
)

echo Source code has been successfully copied to %DESTINATION% folder.
pause
endlocal