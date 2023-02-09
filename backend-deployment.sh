oc login --token="$OC_TOKEN" --server="$OC_SERVER"
oc project "$PROJECT_NAME"
oc apply -f backend-deployment.yaml  
