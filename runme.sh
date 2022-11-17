#!/bin/bash

export TF_VAR_mypublicipaddress=$(curl -s ifconfig.me/ip)
export TF_VAR_adminpassword=$(pwgen 12 1)
export TF_VAR_tenant_id=$(az account show | jq -r ".tenantId")
export TF_VAR_subscription_id=$(az account show | jq -r ".id")

tfren
terraform init
terraform fmt

# DANGUROUS: THIS IF FOR DEMO PURPOSES ONLY
terraform apply --auto-approve
# terraform destroy --auto-approve
