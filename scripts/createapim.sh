#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceGroupName=$1
resourceGroupLocation=$2
apiManagementName=$3
apiManagementPublisherEmail=$4
apiManagementPublisherName=$5
resourceTags=$6

echo "$apiManagementName: check if exists"
apiManagementCheck=`az apim list --query "[?name=='$apiManagementName']"`

if [ ${#apiManagementCheck} -lt 3 ]; then
    echo "Creating api management named $apiManagementName with tags $resourceTags"
    az apim create -g $resourceGroupName \
        -l $resourceGroupLocation \
        --name $apiManagementName \
        --publisher-email $apiManagementPublisherEmail \
        --publisher-name "$apiManagementPublisherName" \
		--tags "$resourceTags"
    echo "API Management created successfully"
else
	echo "$apiManagementName: already exists"
fi

