#!/bin/bash

export TF_VAR_mypublicipaddress=$(curl -s ifconfig.me/ip)
export TF_VAR_adminpassword=$(pwgen 12 1)
export TF_VAR_tenant_id=$(az account show | jq -r ".tenantId")
export TF_VAR_subscription_id=$(az account show | jq -r ".id")
export TF_VAR_storusaz140name="storusaz140jag"
export TF_VAR_storjwaz140name="storjwaz140jag"
export TF_VAR_storukaz140name="storukaz140jag"

tfren
terraform init
terraform fmt
# terraform plan
terraform apply --auto-approve
# terraform destroy --auto-approve