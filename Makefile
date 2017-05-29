.PHONY: python

python:
	python -m grpc_tools.protoc -I=proto/. --python_out=python/. --grpc_python_out=python/. proto/helloworld.proto
