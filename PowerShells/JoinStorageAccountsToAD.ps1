# Set required variables
param ($ResourceGroupName, $StorageAccountName)
$DomainAccountType = "ComputerAccount"
$EncryptionType = "AES256"

# Join Azure Storage Account to AD
Join-AzStorageAccountForAuth -ResourceGroupName $ResourceGroupName -StorageAccountName $StorageAccountName -DomainAccountType $DomainAccountType -EncryptionType $EncryptionType
# Run the command below if you want to enable AES 256 authentication. If you plan to use RC4, you can skip this step.
Update-AzStorageAccountAuthForAES256 -ResourceGroupName $ResourceGroupName -StorageAccountName $StorageAccountName

# Set Share-Level default permission
$defaultPermission = "StorageFileDataSmbShareElevatedContributor"
Set-AzStorageAccount -ResourceGroupName $ResourceGroupName -AccountName $StorageAccountName -DefaultSharePermission $defaultPermission
