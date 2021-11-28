build:
	go build -o server main.go

run:	build
	./server

watch:
	air make run

load:
	docker build -t hello-world .
	minikube image load hello-world
	kubectl create -f pod.yaml

start:	
	minikube service helloworld-service