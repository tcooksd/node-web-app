#!/bin/bash 

dockerimage=$(docker ps  | awk '{print $1}'  | grep -v CONT)

docker stop $dockerimage 
if [ $? -ne "0" ]
  then 
    exit 3
fi 

docker rm $dockerimage 
if [ $? -ne "0" ]
  then 
    exit 4
fi 

dockerimage=""

docker build -t  tcooksd858/node-web-app .
if [ $? -ne "0" ]
  then 
    exit 5
fi 

docker run -it  -p 49160:8080 -d tcooksd858/node-web-app
if [ $? -ne "0" ]
  then 
    exit 6
fi 

sleep 4
dockerimage=$(docker ps  | awk '{print $1}'  | grep -v CONT)

if [ -z "$dockerimage" ]
  then
   docker run -it  -p 49160:8080 -d tcooksd858/node-web-app bash
   dockerimage=$(docker ps  | awk '{print $1}'  | grep -v CONT)
   docker exec -it $dockerimage /bin/bash
fi 

echo "image value = $dockerimage"
    
