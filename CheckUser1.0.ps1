$user = Read-Host "Enter user login name: "

<#Try monitors for errors in the event they occur. Catch tracks the error and can recover the flow of the script
and can detect the type of error that has occured#>
$user = $(
try {

Get-ADUser $user
Write-Host 'User found'
exit

} 

catch [System.DirectoryServices.ActiveDirectory.ActiveDirectoryObjectExistsException]{

$null
Write-Host "Object not found" -BackgroundColor Red

}
catch [System.Management.Automation.ParameterBindingException] {
$null
Write-Host "Please enter a valid input " -BackgroundColor Red
}

)

$prompt = Read-host "Would you like to create the user? (Y/N)"


if($prompt -eq "Y")
{
$path = "OU=Users,OU=Home,DC=Reborn,DC=local"
$Name = Read-Host "ENTER FULL NAME"
$GivenName = Read-Host "ENTER FIRST NAME"
$SurName = Read-Host "ENTER SURNAME"
$SamAccountName = Read-Host "ENTER LOGIN NAME"

New-ADUser `
-Name $Name `
-GivenName $GivenName `
-Surname $SurName `
-SamAccountName $SamAccountName `
-ChangePasswordAtLogon $true `
-Enabled $true `
-AccountPassword (Read-Host -AsSecureString "Input User Password") `
-Path $path`
 
Write-Host "User" $SamAccountName "successfully created." -BackgroundColor DarkGreen
}

elseif($prompt = "N")
{
    Write-Host "Goodbye" -BackgroundColor Black
}
