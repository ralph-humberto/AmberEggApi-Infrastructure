#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"

resourceGroupName=$1
resourceKubernetesName=$2
resourceCount=$3
resourceTags=$4
vnetId=$7
appId=$5
password=$6
vnetSubnetId=$7

echo "$kuberneteServiceName: check if exists"
kuberneteServiceCheck=`az aks list --query "[?name=='$resourceKubernetesName']"`

if [ ${#kuberneteServiceCheck} -lt 3 ]; then
    echo "Creating resource-kubernetes named $resourceKubernetesName with tags $resourceTags"
	echo "    az aks create --resource-group $resourceGroupName \\\n" +
	  	 "--location eastus \\\n" +
         "--name $resourceKubernetesName --node-count $resourceCount \\\n" +
         "--enable-addons monitoring --generate-ssh-keys \\\n" +
         "--tags $resourceTags --network-plugin azure --vnet-subnet-id $vnetSubnetId \\\n" +
         "--service-principal $appId --client-secret $password"
    az aks create --resource-group $resourceGroupName \
		--location eastus \
        --name $resourceKubernetesName --node-count $resourceCount \
        --enable-addons monitoring --generate-ssh-keys \
        --tags $resourceTags --network-plugin azure --vnet-subnet-id $vnetSubnetId \
        --service-principal $appId --client-secret $password
    echo "Resource kubernetes created successfully"
else
    echo "$kuberneteServiceName: already exists"
fi
