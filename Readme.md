To run this project :

1) Look at the Makefile
2) _make load_ - Run this command to build and load the image to minikube . Before this make sure you have minikube started using minikube start
3) _make start_ - Run this command to start the service 

This branch talks about usign Nodeport to communicate via services to the underlying pod. make load and make start have the following commands :

# Start minikube
minikube start

# Set docker env
eval $(minikube docker-env)             # To point your shell to minikube's docker-daemon

# Build image
docker build -t hello-world .

#Load image into Minikube
minikube image load hello-world

# Apply  pod.yaml to create a deployment and a service 
kubectl create -f pod.yaml

# Get all the services
kubectl get svc

# Start the service
minikube service helloworld-service
