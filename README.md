# Amber Egg Api Resource

This is the pipeline on Azure DevOps to create the environment on Azure Platform.

## Summary

This pipeline creates:
- A resource group;
- A vnet to be used in all resources;
- A kubernetes environment;
- A container registry;
- An API Management;
  
## Variables:
To run the pipeline, is necessary set follow variables on that:
- $(apiManagementPublisherEmail)
- $(apiManagementPublisherName)
- $(appId)
- $(count)
- $(env)
- $(password)
- $(resourceApiManagementNamePreffix)
- $(resourceContainerRegistryName)
- $(resourceGroupLocation)
- $(resourceGroupNamePreffix)
- $(resourceKubernetesNamePreffix)
- $(resourceVnetId)
- $(resourceVsubnetId)
- $(subscription)
- $(tags)