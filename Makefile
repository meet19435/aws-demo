test:
	sudo docker exec $$(sudo docker ps -aqf "name=aws-demo_pythonapp") poetry run pytest