#!/bin/bash
cd /cloudacademy
git clone https://github.com/cloudacademy/ca-hands-on-terragrunt-azure
cp -r ./ca-hands-on-terragrunt-azure/$1/* /cloudacademy/lab
chmod -R 777 /cloudacademy

# Replace Resource Group Name
find "/cloudacademy" -name "*.tf" | xargs sed -i "s/REPLACEME/$2/g"
find "/cloudacademy" -name "*.hcl" | xargs sed -i "s/REPLACEME/$2/g"

# Replace Storage Account Name
find "/cloudacademy" -name "*.hcl" | xargs sed -i "s/STORAGEACCOUNT/$3/g"
