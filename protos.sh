mkdir -p ./lib/proto && protoc --dart_out=grpc:./lib/proto/ --proto_path=./proto/proto $(find ./proto/proto -type f -iname "*.proto")