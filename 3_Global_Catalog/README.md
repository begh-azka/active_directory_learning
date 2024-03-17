# Global Catalog
- The global catalog is a feature of Active Directory (AD) that allows a domain controller (DC) to provide information on any object in the forest, regardless of whether the object is a member of its domain. Domain controllers with the global catalog feature enabled are referred to as **global catalog servers.**
- The Global Catalog stores a partial list of attributes for domains in the forest.
- Supports queries for resources in other domains in the forest.

## Configuring Global Catalog
- When a new domain is created, the first DC will be made a global catalog server. To configure additional DCs as global catalog servers, either enable the Global Catalog checkbox in the server’s NTDS Settings properties in the Active Directory Sites and Services management console, or use the following PowerShell cmdlet:

```ps1
Set-ADObject -Identity (Get-ADDomainController -Server <SERVER>).NTDSSettingsObjectDN -Replace @{options='1'} 
```
