    #!/bin/bash
    apt-get update && apt-get install jq curl -y
    TARGET_POD=$1
    TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
    NAMESPACE=$2
    if [[ $NAMESPACE == "" ]]; then
    NAMESPACE=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)
    fi
    KUBERNETES=https://kubernetes.default.svc.cluster.local/api/v1/namespaces/$NAMESPACE/pods
    POD_COUNT=$(curl -s -H "Authorization: Bearer $TOKEN" $KUBERNETES --insecure | jq '.items | length')
    for (( c=0; c<=$POD_COUNT ; c++ ))
    do
       POD_NAME=$(curl -s -H "Authorization: Bearer $TOKEN" $KUBERNETES --insecure |jq .items | jq .[$c] | jq .metadata | jq -r .name)
       if [[ $POD_NAME == *$TARGET_POD* ]]; then
       curl -s $KUBERNETES/$POD_NAME -X DELETE -k -H "Authorization: Bearer $TOKEN"
       fi
    done
