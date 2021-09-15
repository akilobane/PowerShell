$path = "OU=Users,OU=Home,DC=Labyrinth,DC=local"
New-ADUser `
-Name ($FullName = Read-Host "ENTER FULL NAME...") `
-GivenName (Read-Host "ENTER FIRST NAME...") `
-Surname (Read-Host "ENTER SURNAME...") `
-SamAccountName ($LoginName = Read-Host "ENTER USERNAME") `
-ChangePasswordAtLogon $true `
-Enabled $true `
-AccountPassword (Read-Host -AsSecureString "Input User Password") `
-Path $path;

Write-Host "User $FullName created with the username $LoginName"; Get-ADUser -Identity $LoginName -Properties * 
 
<# Booleans are created like variables e.g $true/$false #>
<# Read-Host asks for user input. -AsSecureString masks input as *** #>