@echo off
REM Build Android library using gomobile

echo Building Syncreve Android library...

echo Installing gomobile...
go install golang.org/x/mobile/cmd/gomobile@latest
go install golang.org/x/mobile/cmd/gobind@latest
go get golang.org/x/mobile/bind
gomobile init

REM Set output directory
set OUTPUT_DIR=..\..\android\app\libs

REM Create output directory if it doesn't exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

REM Build the library
echo Building AAR for Android...
gomobile bind -target=android -androidapi 23 -o syncreve.aar github.com/xkeyC/Syncreve/pkg/mobile

REM Move files to output directory
if exist syncreve.aar (
    move /Y syncreve.aar "%OUTPUT_DIR%\"
    echo Android library built successfully: %OUTPUT_DIR%\syncreve.aar
)

if exist syncreve-sources.jar (
    move /Y syncreve-sources.jar "%OUTPUT_DIR%\"
    echo Sources jar moved: %OUTPUT_DIR%\syncreve-sources.jar
)

REM Clean up go.mod if it was modified
go mod tidy

echo Build complete!
pause
