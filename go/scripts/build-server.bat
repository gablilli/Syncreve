@echo off
REM Build Syncreve gRPC Server

echo Building Syncreve gRPC Server...
echo.

REM Create build directory
if not exist build mkdir build

REM Build the server
go build -o build\grpc-server.exe .\cmd\grpc-server

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Build successful!
    echo    Output: build\grpc-server.exe
    echo.
    echo To run the server:
    echo    .\build\grpc-server.exe
    echo.
    echo Or with custom port:
    echo    .\build\grpc-server.exe -port 8080
) else (
    echo.
    echo ❌ Build failed!
)
