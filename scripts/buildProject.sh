#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
sourceDirectory=src

echo "Updating local files"
git pull

echo "Building project"
cd $sourceDirectory
dotnet restore
sleep 2
dotnet build
sleep 2
dotnet test


#git clone $projectRepository $projectDirectory
#git checkout $projectBranch