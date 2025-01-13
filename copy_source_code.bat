@echo off
setlocal

:: 獲取當前目錄的所有資料夾
echo 當前目錄的資料夾：
for /d %%D in (*) do (
    echo %%D
)

:: 請求用戶輸入資料夾名稱
set /p FOLDER_NAME="請輸入要複製的資料夾名稱: "

:: 檢查是否提供了資料夾名稱
if "%FOLDER_NAME%"=="" (
    echo 請提供資料夾名稱.
    exit /b 1
)

set PROJECT_PATH=%FOLDER_NAME%
set DESTINATION=SourceCode

:: 創建 SourceCode 資料夾（如果尚不存在）
if not exist "%DESTINATION%" (
    mkdir "%DESTINATION%"
)

:: 複製源代碼到 SourceCode 資料夾，排除 bin 和 obj 資料夾
xcopy "%PROJECT_PATH%\*" "%DESTINATION%\" /E /I /EXCLUDE:bin\*;obj\* /Y

echo 源代碼已成功複製到 %DESTINATION% 資料夾.
endlocal