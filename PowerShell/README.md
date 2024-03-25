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
### 
