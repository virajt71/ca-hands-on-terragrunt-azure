#!/bin/bash
cd /cloudacademy
git clone https://github.com/cloudacademy/ca-hands-on-terragrunt-azure
cp -r ./ca-hands-on-terragrunt/$1/* /cloudacademy/lab
find "/cloudacademy" -name "*.tf" | xargs sed -i "s/REPLACEME/$2/g"
find "/cloudacademy" -name "*.hcl" | xargs sed -i "s/REPLACEME/$2/g"