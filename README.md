# Hands on Terragrunt lab.

cd terraformlab
cp -p -a ./production/. ./development/

sed -i 's/calabserver/calabdevserver/g' ./development/environment_vars.yaml 
sed -i 's+10.0.0.0/16+10.1.0.0/16+g' ./development/environment_vars.yaml 
sed -i 's+10.0.0.0/24+10.1.0.0/24+g' ./development/environment_vars.yaml 
find "." -name "*.yaml" | xargs sed -i "s/REPLACEME/<rg-name>/g" 
find "." -name "*.hcl" | xargs sed -i "s/REPLACEME/<rg-name>/g" 
find "." -name "*.hcl" | xargs sed -i "s/STORAGEACCOUNT/<sa_name>/g"
