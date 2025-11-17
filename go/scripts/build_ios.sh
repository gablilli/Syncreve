#!/bin/bash
# Build iOS framework using gomobile

echo "Building Syncreve iOS framework..."

# Check if gomobile is installed
if ! command -v gomobile &> /dev/null; then
    echo "Installing gomobile..."
    go install golang.org/x/mobile/cmd/gomobile@latest
    go install golang.org/x/mobile/cmd/gobind@latest
    gomobile init
fi

# Set output directory
OUTPUT_DIR="../../mobile/ios/Frameworks"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Build the framework
echo "Building Framework for iOS..."
gomobile bind -target=ios -o Syncreve.xcframework github.com/xkeyC/Syncreve/pkg/mobile

# Move framework to output directory
if [ -d "Syncreve.xcframework" ]; then
    if [ -d "$OUTPUT_DIR/Syncreve.xcframework" ]; then
        rm -rf "$OUTPUT_DIR/Syncreve.xcframework"
    fi
    mv -f Syncreve.xcframework "$OUTPUT_DIR/"
    echo "iOS framework built successfully: $OUTPUT_DIR/Syncreve.xcframework"
fi

# Clean up go.mod if it was modified
go mod tidy

echo "Build complete!"
