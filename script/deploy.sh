#!/bin/bash

TOTAL_COUNT=`jdc nc describe-containers --input-json "file:///home/jenkins/container-filter.json" |jq .result.totalCount`
CONTAINER_ID=`jdc nc describe-containers --input-json "file:///home/jenkins/container-filter.json" |jq .result.containers[0].containerId | sed -e 's/^["]*//;s/["]*$//'`
if [ "$TOTAL_COUNT" == "0" ]; then
        echo "The count of existing container is 0"
else
        echo $CONTAINER_ID
        jdc nc delete-container --container-id ${CONTAINER_ID}
fi

echo "Create new container"

NEW_CONTAINER_ID=`jdc nc create-containers --input-json file:///home/jenkins/create-containers-spring.json|jq .result.containerIds[0] | sed -e 's/^["]*//;s/["]*$//'`
EIP_ID="fip-ujbnmq2j7v"


echo "Associate EIP"

jdc nc associate-elastic-ip --container-id ${NEW_CONTAINER_ID} --elastic-ip-id ${EIP_ID}


sleep 3m

curl http://116.196.86.237:8080