#!/bin/bash

set -x
python3.7 -m venv todo-list-aws
source todo-list-aws/bin/activate
python3.7 -m pip install --upgrade pip
#For static testing
python3.7 -m pip install radon
python3.7 -m pip install flake8
python3.7 -m pip install flake8-polyfill
python3.7 -m pip install bandit
#For integration testing
python3.7 -m pip install pytest
#For unit testing
python3.7 -m pip install boto3
python3.7 -m pip install moto
python3.7 -m pip install mock==4.0.2
python3.7 -m pip install coverage==4.5.4


pwd