# PowerShell

```ps1
Import-Module ActiveDirectory
Get-ADUser -Identity 'Administrator'
Get-ADUser -Filter {Name -eq 'Administrator'}
Get-ADUser -Identity 'Administrator' -Properties Description
```
