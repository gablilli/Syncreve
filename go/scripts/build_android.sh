#!/bin/bash
# Build Android library using gomobile

echo "Building Syncreve Android library..."

# Check if gomobile is installed
if ! command -v gomobile &> /dev/null; then
    echo "Installing gomobile..."
    go install golang.org/x/mobile/cmd/gomobile@latest
    go install golang.org/x/mobile/cmd/gobind@latest
    gomobile init
fi

# Set output directory
OUTPUT_DIR="../../mobile/android/app/libs"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Build the library
echo "Building AAR for Android..."
gomobile bind -target=android -androidapi 23 -o syncreve.aar github.com/xkeyC/Syncreve/pkg/mobile

# Move files to output directory
if [ -f "syncreve.aar" ]; then
    mv -f syncreve.aar "$OUTPUT_DIR/"
    echo "Android library built successfully: $OUTPUT_DIR/syncreve.aar"
fi

if [ -f "syncreve-sources.jar" ]; then
    mv -f syncreve-sources.jar "$OUTPUT_DIR/"
    echo "Sources jar moved: $OUTPUT_DIR/syncreve-sources.jar"
fi

# Clean up go.mod if it was modified
go mod tidy

echo "Build complete!"
