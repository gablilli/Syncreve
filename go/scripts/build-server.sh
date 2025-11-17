#!/bin/bash
# Build Syncreve gRPC Server

echo "Building Syncreve gRPC Server..."
echo ""

# Create build directory
mkdir -p build

# Build the server
go build -o build/grpc-server ./cmd/grpc-server

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful!"
    echo "   Output: build/grpc-server"
    echo ""
    echo "To run the server:"
    echo "   ./build/grpc-server"
    echo ""
    echo "Or with custom port:"
    echo "   ./build/grpc-server -port 8080"
else
    echo ""
    echo "❌ Build failed!"
    exit 1
fi
