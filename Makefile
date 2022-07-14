APP_NAME = newworld
IMG_NAME = newworld
MODEL_VOLUME = /home/szjung/workspace/newworld:/workspace/newworld
# Build and run the container
build:
	@echo 'build docker $(APP_NAME)'
	docker build -t $(APP_NAME) . 

run:
	@echo 'run docker $(APP_NAME)'
	docker run -d -t --name="$(APP_NAME)" --net=host --ipc=host --shm-size 32gb -v $(MODEL_VOLUME) --gpus all $(IMG_NAME)

stop:
	@echo 'stop docker $(APP_NAME)'
	docker stop $(APP_NAME)

start:
	@echo 'start docker $(APP_NAME)'
	docker start $(APP_NAME)

restart:
	@echo 'restart docker $(APP_NAME)'
	docker restart $(APP_NAME)

rm:
	@echo 'rm docker $(APP_NAME)'
	docker rm -f $(APP_NAME)

rmi:
	@echo 'rmi docker $(APP_NAME)'
	docker rmi $(APP_NAME)