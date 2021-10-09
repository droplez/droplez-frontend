.PHONY: protoc-docs-gen
# Generate documentarion in markdown
docker-docs-gen:
	docker run --rm \
  	-v $$(pwd):/out \
  	-v $$(pwd)/proto:/proto \
  	pseudomuto/protoc-gen-doc --doc_opt=markdown,README.md --proto_path=proto \
		$$(find proto -type f -iname "*.proto")
# Lint protobuf files
docker-lint:
	docker run --rm \
		-v $$(pwd):/workspace \
		--workdir /workspace \
		yoheimuta/protolint lint \
		$$(find . -type f -iname "*.proto")