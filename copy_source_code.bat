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

:: Prompt user to input folder name directly
set /p FOLDER_NAME="Please enter the folder name to copy: "

:: Check if the folder exists
if not exist "%FOLDER_NAME%" (
    echo The specified folder does not exist.
    exit /b 1
)

set PROJECT_PATH=%FOLDER_NAME%
set DESTINATION=SourceCode

:: Create SourceCode folder if it doesn't exist
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

:: Check for compilation folders in PROJECT_PATH
set hasCompilationFiles=0
for /d %%D in ("%PROJECT_PATH%\*") do (
    if /i "%%~nxD"=="bin" (
        set hasCompilationFiles=1
    )
    if /i "%%~nxD"=="obj" (
        set hasCompilationFiles=1
    )
)

:: If compilation folders are found, exit
if %hasCompilationFiles%==1 (
    echo Compilation folders found in %PROJECT_PATH%. Exiting.
    exit /b 1
)

:: Copy source code to SourceCode folder, including all subfolders
xcopy "%PROJECT_PATH%\*" "%DESTINATION%\" /E /I /Y

echo Source code has been successfully copied to %DESTINATION% folder.
pause
endlocal