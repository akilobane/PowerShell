New-ADUser `
-Name "Anakin Skywalker" `
-GivenName "Anakin" `
-Surname "Skywalker" `
-SamAccountName "askywalker" `
-ChangePasswordAtLogon $true `
-Department "Jedi Order" `
-Title "Jedi Knight" `
-EmailAddress "askywalker@gmail.com" `
-Description "Was given a seat on the high council but not the rank of master" `
-Enabled $true `
-AccountPassword (Read-Host -AsSecureString "Input User Password") `
-Path "OU=Home,DC=Labyrinth,DC=local"
 
<# Booleans are created like variables e.g $true/$false #>
<# Read-Host asks for user input. -AsSecureString masks input as *** #>
<# This is v1.0#>