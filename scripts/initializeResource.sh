#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceTags="AmberEggApi Dev KeepOnlineOnlyWorkTime"
resourceContainerRegistryName=acr-cr-dev-amberegg
resourceGroupName=rs-gp-dev-001
resourceGroupLocation=eastus
resourceKubernetesName=aks-dev-001
appId="04a11d74-feb5-4b5e-a34a-5b30cf2c436c"
password="zm1zBYWHSREgJwYFH80H~IPV.3CGEahSyd"
#
# Create 
#
echo "Creating resource-group named $resourceGroupName with tags $resourceTags"
az group create --name $resourceGroupName --location eastus --tags $tags
echo "Resource group created successfully"

echo "Creating resource-kubernetes named $resourceKubernetesName with tags $resourceTags"
az aks create --resource-group $resourceGroupName \
	--name $resourceKubernetesName --node-count 1 \
	--enable-addons monitoring --generate-ssh-keys \
	--tags $tags \
	--service-principal $appId --client-secret $password
echo "Resource kubernetes created successfully"

echo "Creating resource-containerregistry named $resourceContainerRegistryName with tags $resourceTags"
az acr create --resource-group $resourceGroupName \
	--name $resourceContainerRegistryName --sku Basic \
	--tags $tags
echo "Resource kubernetes created successfully"