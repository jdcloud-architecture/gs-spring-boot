#!/bin/bash
DOCKER_LOGIN=`cat /home/jenkins/jdcloud-demo-token.json |jq .result.loginCmdLine | sed -e 's/^["]*//;s/["]*$//'`
if [ "$DOCKER_LOGIN" == "null" ]; then
  echo "Failed to get Docker login command"    
  DOCKER_TOKEN=`jdc cr get-authorization-token --registry-name jdcloud-demo > /home/jenkins/jdcloud-demo-token.json` 
        DOCKER_LOGIN=`cat /home/jenkins/jdcloud-demo-token.json |jq .result.loginCmdLine | sed -e 's/^["]*//;s/["]*$//'`
fi
if $DOCKER_LOGIN; then
        echo "login success"
else
        echo "login fail"
fi


mvn package dockerfile:build

docker push jdcloud-demo-cn-north-1.jcr.service.jdcloud.com/gs-spring-boot:latest
