#!/bin/sh
TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
NAMESPACE=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)
if [ $DEBUG == "on" ];then
sleep 100000000
else
curl -X PATCH -H  "Authorization: Bearer $TOKEN" -H 'Content-Type: application/strategic-merge-patch+json' --data '{"spec": {"replicas":0}}' 'https://kubernetes.default.svc.cluster.local/apis/apps/v1/namespaces/'$NAMESPACE'/deployments/'$1 --insecure
sleep 10s
curl -X PATCH -H  "Authorization: Bearer $TOKEN" -H 'Content-Type: application/strategic-merge-patch+json' --data '{"spec": {"replicas":1}}' 'https://kubernetes.default.svc.cluster.local/apis/apps/v1/namespaces/'$NAMESPACE'/deployments/'$1 --insecure

fi
