# Import Module
Import-Module ActiveDirectory

# List all Disabled AD Users
Search-ADAccount -AccountDisabled | Select-Object Name, DistinguishedName
 
# Move all Disabled AD Users to Disabled Users OU except those that are already in Disabled Users
Search-ADAccount -AccountDisabled | Where {$_.DistinguishedName -notlike "OU=Disabled Users"} | Move-ADObject -TargetPath "OU=Disabled Users, OU=azka, DC=azka, DC=local"
 
# Disable All Users in an OU
Get-ADUser -Filter {Enabled -eq $True} -SearchBase "OU=Disabled users, OU=azka, DC=azka, DC=local" | Disable-ADAccount 
