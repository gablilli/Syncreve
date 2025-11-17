@echo off
REM Build iOS framework using gomobile

echo Building Syncreve iOS framework...

REM Check if gomobile is installed
where gomobile >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Installing gomobile...
    go install golang.org/x/mobile/cmd/gomobile@latest
    go install golang.org/x/mobile/cmd/gobind@latest
    gomobile init
)

REM Set output directory
set OUTPUT_DIR=..\..\mobile\ios\Frameworks

REM Create output directory if it doesn't exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

REM Build the framework
echo Building Framework for iOS...
gomobile bind -target=ios -o Syncreve.xcframework github.com/xkeyC/Syncreve/pkg/mobile

REM Move framework to output directory
if exist Syncreve.xcframework (
    if exist "%OUTPUT_DIR%\Syncreve.xcframework" (
        rmdir /S /Q "%OUTPUT_DIR%\Syncreve.xcframework"
    )
    move /Y Syncreve.xcframework "%OUTPUT_DIR%\"
    echo iOS framework built successfully: %OUTPUT_DIR%\Syncreve.xcframework
)

REM Clean up go.mod if it was modified
go mod tidy

echo Build complete!
pause
