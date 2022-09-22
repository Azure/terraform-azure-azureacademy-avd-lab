$UserName="user1"
$UserDisplayname="FirstName LastName"
$User1Password = "SuperSecretPassword"
$SecureUser1Password = ConvertTo-SecureString -AsPlainText -String $User1Password -Force
New-ADUser -SamAccountName $UserName -Name $UserDisplayname -AccountPassword $SecureUser1Password -ChangePasswordAtLogon $False -DisplayName $UserDisplayname -Enabled $True -PasswordNeverExpires $True
