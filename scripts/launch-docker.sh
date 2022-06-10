#!/bin/sh
### Lanzar el deployment de docker en local
cd ..
#Levantar DynamoDB en local
docker run -p 8000:8000 --network sam --name dynamodb -d amazon/dynamodb-local

## Crear la tabla en local, para poder trabajar localmemte
aws dynamodb create-table --table-name local-TodosDynamoDbTable --attribute-definitions AttributeName=id,AttributeType=S --key-schema AttributeName=id,KeyType=HASH --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 --endpoint-url http://localhost:8000 --region us-east-1

## Empaquetar sam
sam build # también se puede usar sam build --use-container si se dan problemas con las librerías de python

## Levantar la api en local, en el puerto 8080, dentro de la red de docker sam
nohup sam local start-api --port 8081 --env-vars localEnvironment.json --docker-network sam &
