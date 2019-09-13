DOCKER_IMAGE_NAME?=beunproject

.PHONY: build start-stack stop-stack drop-stack makemigrations migrate attach shell

build:
	docker build -t beunproject:latest .

start-stack: build
	docker-compose up

stop-stack:
	docker-compose stop -t 0

drop-stack:
	docker-compose down -v -t 0

makemigrations:
	python beunproject/manage.py makemigrations

runserver:
	python beunproject/manage.py runserver

migrate:
	python beunproject/manage.py migrate

attach:
	docker-compose exec beunproject bash -c "export COLUMNS=`tput cols`; export LINES=`tput lines`; exec bash"

shell:
	python beunproject/manage.py shell_plus --ipython
