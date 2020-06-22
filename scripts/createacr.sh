#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceGroupName=$1
resourceContainerRegistryName=$2
resourceTags=$3

echo "$resourceContainerRegistryName: check if exists"
resourceContainerRegistryCheck=`az acr list --query "[?name=='$resourceContainerRegistryName']"`

if [ ${#resourceContainerRegistryCheck} -lt 3 ]; then
    echo "Creating resource-containerregistry named $resourceContainerRegistryName with tags $resourceTags"
    az acr create --resource-group $resourceGroupName \
        --name $resourceContainerRegistryName --sku Basic \
        --tags $resourceTags
    echo "Resource container registry created successfully"
else
    echo "$resourceContainerRegistryName: already exists"
fi
