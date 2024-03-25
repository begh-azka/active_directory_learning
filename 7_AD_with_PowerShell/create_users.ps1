# Import Active Directory Module
Import-Module ActiveDirectory

# Prompt User for Variables
$firstName     =  Read-Host -Prompt "First Name: "
$lastName      =  Read-Host -Prompt "Last Name: "
$userName      =  ("$firstName" + " " + "$lastName")
$displayName   =  Read-Host -Prompt "Display Name: "
$password      =  Read-Host -Prompt "Enter a Strong Password (Length 10): "
$emailAddr     =  Read-Host -Prompt "Email Address: "
$logonName     =  "$emailAddr".Replace("@gmail.com", "").ToLower()

# Check if User Name Exists
if (Get-ADUser -F {Name -eq $userName}) {
    Write-Warning "Username already exists. Please choose a different Name."
 }
# Create User
else {
    New-ADUser `
      -Name "$userName" `
      -GivenName "$firstName" `
      -Surname "$lastName" `
      -UserPrincipalName "$logonName@azka.local" `
      -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -Force) `
      -Path "OU=Domain Users, OU=azka, DC=azka, DC=local" `
      -Enabled 1 `
      -DisplayName "$displayName" `
      -SamAccountName "$logonName" `
      -EmailAddress "$emailAddr" 
}
