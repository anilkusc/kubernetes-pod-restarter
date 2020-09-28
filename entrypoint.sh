#!/bin/sh
apt-get update && apt-get install jq curl -y
TARGET_POD=$1
TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
NAMESPACE=$2
if [[ $NAMESPACE == "" ]]; then
NAMESPACE=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)
fi
POD_COUNT=$(curl -s -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/namespaces/$NAMESPACE/pods/ --insecure | jq '.items | length')
for (( c=0; c<=$POD_COUNT; c++ ))
do  
   POD_NAME=$(curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/namespaces/$NAMESPACE/pods/ --insecure | jq .items | jq .[$i] | jq .metadata | jq .name)
   if [[ $POD_NAME == *$TARGET_POD* ]]; then
   curl https://kubernetes/api/v1/namespaces/$NAMESPACE/pods/$POD_NAME -X DELETE -k -H "Authorization: Bearer $TOKEN"
   fi
done
