#!/bin/bash

docker run -t docker_image_name .
sleep 30
docker tag docker_image_name:latest docker_image_name:latest
sleep 10
