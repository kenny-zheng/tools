@echo off
echo Please select the environment:
echo 1. Development
echo 2. Staging
echo 3. Production
echo 4. Custom (Enter your own value)
set /p choice=Enter your choice (1-4): 

if %choice%==1 (
    set ASPNETCORE_ENVIRONMENT=Development
) else if %choice%==2 (
    set ASPNETCORE_ENVIRONMENT=Staging
) else if %choice%==3 (
    set ASPNETCORE_ENVIRONMENT=Production
) else if %choice%==4 (
    set /p customValue=Enter your custom environment value: 
    set ASPNETCORE_ENVIRONMENT=%customValue%
) else (
    echo Invalid option, defaulting to Development
    set ASPNETCORE_ENVIRONMENT=Development
)

echo ASPNETCORE_ENVIRONMENT is set to %ASPNETCORE_ENVIRONMENT%
echo Current ASPNETCORE_ENVIRONMENT is set to %ASPNETCORE_ENVIRONMENT%