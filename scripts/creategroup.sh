#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceGroupName=$1
resourceGroupLocation=$2
resourceTags=$3

echo "$resourceGroupName: check if exists"
resourceGroupCheck=`az group list --query "[?name=='$resourceGroupName']"`

if [ ${#resourceGroupCheck} -lt 3 ]; then
    echo "Creating resource-group named $resourceGroupName with tags $resourceTags"
    az group create --name $resourceGroupName --location $resourceGroupLocation --tags $resourceTags
    echo "Resource group created successfully"
else
	echo "$resourceGroupName: already exists"
fi