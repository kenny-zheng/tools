@echo off
setlocal

:: 檢查是否提供了專案路徑
if "%~1"=="" (
    echo 請提供 .NET 專案的路徑.
    exit /b 1
)

set PROJECT_PATH=%~1
set DESTINATION=SourceCode

:: 創建 SourceCode 資料夾（如果尚不存在）
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

:: 複製源代碼到 SourceCode 資料夾，排除 bin 和 obj 資料夾
xcopy "%PROJECT_PATH%\*" "%DESTINATION%\" /E /I /EXCLUDE:bin\*;obj\*

echo 源代碼已成功複製到 %DESTINATION% 資料夾.
endlocal