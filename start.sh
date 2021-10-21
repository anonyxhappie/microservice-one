#!/bin/bash

cd /microservice-one/
python3 project_dir/manage.py migrate
cd /microservice-two/
python3 project_dir/manage.py migrate
cd /microservice-three/
python3 project_dir/manage.py migrate

python3 /microservice-one/project_dir/manage.py runserver 0.0.0.0:8000 &
python3 /microservice-two/project_dir/manage.py runserver 0.0.0.0:8001 &
python3 /microservice-three/project_dir/manage.py runserver 0.0.0.0:8002 &

python3 /microservice-one/project_dir/consumer.py &
python3 /microservice-two/project_dir/consumer.py &
python3 /microservice-three/project_dir/consumer.py
