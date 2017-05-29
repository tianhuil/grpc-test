.PHONY: python

build-python:
	pip install -r python/requirements.txt
	python -m grpc_tools.protoc -I=proto/. --python_out=python/proto/. --grpc_python_out=python/proto/. proto/helloworld.proto

python-server:
	python python/greeter_server.py

python-client:
	python python/greeter_client.py

build-node:
	cd node && npm install
	grpc_tools_node_protoc --js_out=import_style=commonjs,binary:node/ --grpc_out=node/ --plugin=protoc-gen-grpc=`which grpc_tools_node_protoc_plugin` proto/helloworld.proto

node-server: build-node
	cd node && node greeter_server.js

node-client: build-node
	cd node && node greeter_client.js
