.PHONY: python

build-python:
	python -m grpc_tools.protoc -I=proto/. --python_out=python/proto/. --grpc_python_out=python/proto/. proto/helloworld.proto

python-server: build-python
	python python/greeter_server.py

python-client: build-python
	python python/greeter_client.py
