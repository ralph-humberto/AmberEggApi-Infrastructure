#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceGroupName=$1
resourceKubernetesName=$2
resourceTags=$3
resourceLocation=$4
subscription=$5
appId=$6
password=$7
vnetId=$8
vnetSubnetId=$9

echo "/subscriptions/$subscription/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$vnetId/subnets/$vnetSubnetId"

echo "$kuberneteServiceName: check if exists"
kuberneteServiceCheck=`az aks list --query "[?name=='$resourceKubernetesName']"`

if [ ${#kuberneteServiceCheck} -lt 3 ]; then
    echo "Creating resource-kubernetes named $resourceKubernetesName with tags $resourceTags"
    az aks create --resource-group $resourceGroupName \
		--location $resourceLocation \
		--docker-bridge-address 172.17.0.1/16 \
		--load-balancer-sku standard \
		--enable-private-cluster \
        --dns-service-ip 10.0.0.10 \
        --service-cidr 10.0.0.0/16 \
        --name $resourceKubernetesName --node-count 1 \
        --enable-addons monitoring --generate-ssh-keys \
        --tags $resourceTags --network-plugin kubenet --enable-managed-identity \
		--vnet-subnet-id "/subscriptions/$subscription/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$vnetId/subnets/$vnetSubnetId" \
        --service-principal $appId --client-secret $password
    echo "Resource kubernetes created successfully"
else
    echo "$kuberneteServiceName: already exists"
fi


    
