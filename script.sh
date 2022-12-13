# Para usuários Linux

#!/bin/bash

echo "Criando as imagens..."

docker build -t paucia/projeto-backend:1.0 backend/.
docker build -t paucia/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push paucia/projeto-backend:1.0
docker push paucia/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl.exe apply -f ./services.yml

echo "Realizando os deployments..."

kubectl.exe apply -f ./deployment.yml