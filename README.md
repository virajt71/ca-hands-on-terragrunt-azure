# Hands on Terragrunt lab.

cd terraformlab
cp -p -a ./production/. ./development/

sed -i 's/calabserver/calabdevserver/g' ./development/environment_vars.yaml 
sed -i 's+10.0.0.0/16+10.1.0.0/16+g' ./development/environment_vars.yaml 
sed -i 's+10.0.0.0/24+10.1.0.0/24+g' ./development/environment_vars.yaml 
find "." -name "*.yaml" | xargs sed -i "s/REPLACEME/<rg-name>/g" 
find "." -name "*.hcl" | xargs sed -i "s/REPLACEME/<rg-name>/g" 
find "." -name "*.hcl" | xargs sed -i "s/STORAGEACCOUNT/<sa_name>/g"

package test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

webserver_test.go
func TestTerraformWebserverExample(t *testing.T) {


	// The values to pass into the Terraform CLI
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		
        // The path to where the example Terraform code is located
		TerraformDir: "../examples/webserver",

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"servername": "testwebserver",
		},
	})


	// Run a Terraform init and apply with the Terraform options
	terraform.InitAndApply(t, terraformOptions)

	// Run a Terraform Destroy at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Retrieve the public IP address using Terraform Show
	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	// Perform an HTTP request to the Public IP to validate status 200 and the body contains the following string
	url := fmt.Sprintf("http://%s:8080", publicIp)
	http_helper.HttpGetWithRetry(t, url, nil, 200, "QA Labs Are Great!", 30, 5*time.Second)
}

find "." -name "*.tf" | xargs sed -i "s/REPLACEME/<re-name>/g"
cd terraformlab/test
go get -t -v
go test -v webserver_test.go
