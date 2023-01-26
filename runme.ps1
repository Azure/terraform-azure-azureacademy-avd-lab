$env:TF_VAR_mypublicipaddress="75.158.114.112"
$env:TF_VAR_adminpassword="aen5TaiNail7"

$env:TF_VAR_tenant_id="72f988bf-86f1-41af-91ab-2d7cd011db47"

$env:TF_VAR_subscription_id="54b875cc-a81a-4914-8bfd-1a36bc7ddf4d"

$env:TF_VAR_storusaz140name="storusaz140i0cc"
$env:TF_VAR_storjwaz140name="storjwaz140i0cc"
$env:TF_VAR_storuksaz140name="storukaz140i0cc"

# tfren
terraform init -upgrade
terraform fmt

# DANGUROUS: THIS IF FOR DEMO PURPOSES ONLY
terraform apply --auto-approve
# terraform destroy --auto-approve

# terraform plan
