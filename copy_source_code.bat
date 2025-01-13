@echo off
:: Enable delayed expansion for variables inside loops
setlocal enabledelayedexpansion

:: Get all directories in the current folder and display them with index numbers
echo Current directories:
set count=0
for /d %%D in (*) do (
    set /a count+=1
    echo !count! - %%D
    set "folder[!count!]=%%D"
)

:: Prompt user to input folder number
set /p FOLDER_INDEX="Please enter the folder number to copy: "

:: Validate the user input
if "!folder[%FOLDER_INDEX%]!"=="" (
    echo Please provide a valid folder number.
    pause
    exit /b 1
)

set "PROJECT_PATH=!folder[%FOLDER_INDEX%]!"
set "DESTINATION=SourceCode"

:: Create the destination folder if it doesn't exist
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

:: Use robocopy to copy the source code while excluding:
:: - bin folders
:: - obj folders
:: - directories starting with a dot (e.g. .git, .svn)
:: /E copies subdirectories (including empty ones)
:: /XD excludes directories matching the provided names or patterns
robocopy "%PROJECT_PATH%" "%DESTINATION%" /E /XD bin obj ".*"

:: Check the robocopy exit code for success or partial success
:: 0 and 1 are considered successful copies
if errorlevel 2 (
    echo An error occurred during copying.
) else (
    echo Source code has been successfully copied to the "%DESTINATION%" folder.
)

pause
endlocal
