# Import Active Directory Module
Import-Module ActiveDirectory

# Prompt User for Variables
$firstName     =  Read-Host -Prompt "Enter the User's First Name"
$lastName      =  Read-Host -Prompt "Enter the User's Last Name"
$displayName   =  Read-Host -Prompt "Enter User's Display Name"
$password      =  Read-Host -Prompt "Enter a Strong Password (Upper Case, Number and a Special Character. Minimum Length should be 10)"
$emailAddr     =  Read-Host -Prompt "Enter Email Address"
$logonName     =  "$emailAddr".Replace("@gmail.com", "")

# Create User
New-ADUser `
    -Name "$firstName $lastName" `
    -GivenName "$firstName" `
    -Surname "$lastName" `
    -UserPrincipalName "$logonName@azka.local" `
    -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -Force) `
    -Path "OU=Domain Users, OU=azka, DC=azka, DC=local" `
    -Enabled 1 `
    -DisplayName "$displayName" `
    # Domain\logonName
    -SamAccountName "$logonName"
 
