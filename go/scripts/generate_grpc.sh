#!/bin/bash
# Generate gRPC code from proto files

echo "Generating gRPC code..."

# Install protoc plugins if not installed
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Generate code for each proto file
for file in pkg/grpc/protos/*.proto; do
    echo "Generating $file..."
    protoc --go_out=. --go_opt=paths=source_relative \
           --go-grpc_out=. --go-grpc_opt=paths=source_relative \
           "$file"
done

echo "Done!"
