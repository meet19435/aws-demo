test:
	sudo docker exec $$(sudo docker ps -aqf "name=project_pythonapp") poetry run pytest