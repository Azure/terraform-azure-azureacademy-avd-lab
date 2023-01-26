#!/bin/bash

export TF_VAR_mypublicipaddress=$(curl -s ifconfig.me/ip)
export TF_VAR_adminpassword=$(pwgen 12 1)
if test -f "adminpassword"
then
    TF_VAR_adminpassword=$(cat adminpassword)
else
    echo -n $TF_VAR_adminpassword > adminpassword
fi
export TF_VAR_tenant_id=$(az account show | jq -r ".tenantId")
export TF_VAR_subscription_id=$(az account show | jq -r ".id")
# RANDOM_STORAGE_ACCOUNT_SUFFIX=$(pwgen 4 1 | tr '[:upper:]' '[:lower:]')
# if test -f "RANDOM_STORAGE_ACCOUNT_SUFFIX"; then
    # RANDOM_STORAGE_ACCOUNT_SUFFIX=$(cat RANDOM_STORAGE_ACCOUNT_SUFFIX)
# else
    # echo -n $RANDOM_STORAGE_ACCOUNT_SUFFIX > RANDOM_STORAGE_ACCOUNT_SUFFIX
# fi
export TF_VAR_storusaz140name="storusaz140i0cc"
export TF_VAR_storjwaz140name="storjwaz140i0cc"
export TF_VAR_storuksaz140name="storukaz140i0cc"

tfren
terraform init -upgrade
terraform fmt

# DANGUROUS: THIS IF FOR DEMO PURPOSES ONLY
time terraform apply --auto-approve
# terraform destroy --auto-approve

# terraform plan
