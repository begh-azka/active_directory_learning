# PowerShell Commands for AD
## User
### To Get Help
```ps1
Get-Help Set-ADUser
Get-Help Get-ADUser
```
### To Import Active Directory Module
```ps1
Import-Module ActiveDirectory
```
### To get Details about Admin User
```ps1
Get-ADUser -Identity 'Administrator'
```
### To Filter Results Based on Certain Attributes
```ps1
Get-ADUser -Filter {Name -eq 'Administrator'}
Get-ADUser -Filter {SamAccountName -eq 'begh.azka'}
```
### To Print Extra Attributes Than What is Printed by above Commands
```ps1
Get-ADUser -Identity 'Administrator' -Properties Description
```
### Set Value of an Attribute for a User
```ps1
Set-ADUser "azka.aslam" -EmailAddress "amicable@gmail.com"
```
### To List All AD Users (Limit 100)
```ps1
Get-ADUser -Filter * -ResultSetSize 100
```
### To List specific Attributes of AD Users (Limit 100)
```ps1
 Get-ADUser -Filter * -ResultSetSize 100 | Select-Object Name, UserPrincipalName, Enabled, lastLogon
```
### To List Users in a Specific OU
The Value inside SearchBase comes from **OU -> Properties -> Attributes Editor -> DistinguishedName**
```ps1
Get-ADUser -Filter * -SearchBase "OU=Domain Users, OU=azka, DC=azka, DC=local" | Select-Object Name
```

### To List All the Locked Accounts
```ps1
Search-ADAccount -AccountDisabled | Select-Object Name 
```
### To Update Profile Path of a Roaming User
```ps1
Set-ADUser "azka" -ProfilePath "\\server-name\folder"
```
### To Update Profile Path of Multiple Roaming Users that are Part of a Group
```ps1
# Import Active directory Module
Import-Module ActiveDirectory
# Get all the members of roaming-group
Get-ADGroupMember 'Group-A' |
   # Loop through each user
   ForEach-Object {
     # Update for each User. SamAccountName is an attribute of the user.
     # Instead of writing "\\ad-server-2\Share-A\%username%" we use + and the user name (same as SamAccountName)
     Set-ADUser -Identity $_.SamAccountName -ProfilePath ("\\ad-server-2\Share-A\" + $_.SamAccountName)
   }
```
### Creating User Accounts
```ps1
# Import Active directory Module
Import-Module ActiveDirectory

# Create User
New-ADUser `
    -Name "Bradley Cooper" `
    -GivenName "Bradley" `
    -Surname "Cooper" `
    -UserPrincipalName "Bradley Cooper" `
    -AccountPassword (ConvertTo-SecureString "password" -AsPlainText -Force) `
    -Path "OU=Domain Users, OU=azka, DC=azka, DC=local" `
    -Enabled 1 `
    -DisplayName "Brad Cooper"
```
Here we have not mentioned -ChangePasswordAtLogon 1, so it is disabled by default
## Groups
### To List Users in a Specific Group along with their Attributes
```ps1
Get-ADGroupMember 'Group-A' | Select-Object Name, DistinguishedName
Get-ADGroupMember -Identity "The Office" | ft
```
### To Export a Large List of Users and their Attributes to a csv File
```ps1
Get-ADGroupMember 'Group-B' | Select-Object Name, DistinguishedName | Export-Csv "C:\Users\azka.aslam\Desktop\myusers.csv"
```
### Add Users to a Group (user identity should always be logon name unless Name is specified)
```ps1
Add-ADGroupMember Group-A -Members "rukhsana.jabeen"
Add-ADGroupMember "Group-B" Jason-Bourne,Benedict.Cumberbatch,AbbeyCrawford,AbbeyEckels (Bulk Adding)
```
## GPO
### Getting GPO of a Single Domain
```ps1
Get-GPO -Name "Group Policy Test"
```
### Creating GPO
```ps1
New-GPO -Name "First-GPO" -StarterGPOName "Windows Vista EC Computer Starter GPO"
```
### Creating GPO and Linking it with Domain and Setting Permission
```ps1
# This command creates a GPO named Test-GPO, links it to the azka OU in the azka.local domain, and grants the Marketing Admins security group permissions to edit the GPO.
New-GPO -Name Test-GPO | New-GPLink -Target "ou=azka,dc=azka,dc=local" | Set-GPPermissions -PermissionLevel gpoedit -TargetName "Marketing Admins" -TargetType Group
```
### Setting a GPO Link
```ps1
Set-GPLink -Name First-GPO -Target "ou=azka,dc=azka,dc=local" -LinkEnabled Yes
```
### Setting GPO Permission 
```ps1
Set-GPPermission -Name First-GPO -TargetName "Domain Users" -TargetType Group -PermissionLevel GpoRead
```
