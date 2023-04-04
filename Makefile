test:
	sudo docker exec $$(sudo docker ps -aqf "name=project-pythonapp") poetry run pytest