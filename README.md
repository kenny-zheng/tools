# 專案名稱 (Project Name)

這是一個 ASP.NET Core 環境設定的專案 (This is a project for configuring the ASP.NET Core environment).

## 描述 (Description)

此專案用於設定 ASP.NET Core 的環境變數 (This project is used to set environment variables for ASP.NET Core)，方便在不同的環境中運行應用程式 (making it easier to run applications in different environments).

## 安裝步驟 (Installation Steps)

1. 下載或克隆此專案 (Download or clone this project).
2. 確保已安裝 .NET SDK (Ensure that the .NET SDK is installed).
3. 在命令行中執行以下命令以安裝依賴 (Run the following command in the command line to install dependencies):
   ```
   dotnet restore
   ```

## 使用說明 (Usage Instructions)

在命令行中執行以下命令以啟動應用程式 (Run the following command in the command line to start the application):
```
dotnet run
```

## 新增功能 (New Feature)

### copy_source_code.bat

此批次檔可接受 .NET 專案的路徑作為輸入，並在當前目錄中創建一個名為 `SourceCode` 的資料夾。它會排除 .NET 編譯產生的相關檔案（如 `bin` 和 `obj` 資料夾），並將源代碼複製到 `SourceCode` 資料夾中。

#### 使用方法 (Usage)

在命令行中執行以下命令：
```
copy_source_code.bat [專案路徑]