# PowerShell Commands for AD

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
Get-ADUser -Filter {SamAccountName -eq 'Administrator'}
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
### To List Users in a Specific Group along with their Attributes
```ps1
Get-ADGroupMember 'Group-A' | Select-object Name, DistinguishedName
```
### To Export a Large List of Users and their Attributes to a csv File
```ps1
Get-ADGroupMember 'Group-B' | Select-Object Name, DistinguishedName | Export-Csv "C:\Users\azka.aslam\Desktop\myusers.csv"
```
