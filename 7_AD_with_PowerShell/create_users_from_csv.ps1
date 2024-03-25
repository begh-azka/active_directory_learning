# Import Active Directory Module
Import-Module ActiveDirectory

# Path of the csv File with User Details
$filePath      = "C:\Users\azka.aslam\Desktop\users-block - Sheet1.csv"

# Import CSV as an Array
$usersAll      = Import-Csv $filePath

# Variable
$password      =  Read-Host -Prompt "Enter a Strong Password"

# Complete an Action for each User in the csv file
ForEach ($user in $usersAll) {

# Variables
$emailAddress     =  $user.'Email Address'
$logonName     =  "$emailAddress".Replace("@gmail.com", "").ToLower()

# Calling each User
New-ADUser `
    -Name ($user.'First Name' + " " + $user.'Last Name') `
    -GivenName $user.'First Name' `
    -Surname $user.'Last Name' `
    -UserPrincipalName "$logonName@azka.local" `
    -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -Force) `
    -Path $user.'Organizational Unit' `
    -DisplayName $user.'Display Name' `
    -SamAccountName "$logonName" `
    -EmailAddress $user.'Email Address' `
    -Enabled ([System.Convert]::ToBoolean($user.Enabled))`
    -ChangePasswordAtLogon 1
}
