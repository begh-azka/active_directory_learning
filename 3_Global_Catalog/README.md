# Global Catalog
- The global catalog is a feature of Active Directory (AD) that allows a domain controller (DC) to provide information on any object in the forest, regardless of whether the object is a member of its domain. Domain controllers with the global catalog feature enabled are referred to as **global catalog servers.**
- The Global Catalog stores a partial list of attributes for domains in the forest.
- Supports queries for resources in other domains in the forest.

## Working of a Global Catalog
- Domain controllers store the Active Directory database in a single file, **NTDS.dit**. To simplify administration and facilitate efficient replication, the database is logically separated into partitions.
- Every domain controller maintains at least three partitions:
  - The **domain partition** contains information about a **domain’s objects and their attributes**. Every DC contains a complete writable replica of its local domain partition.
  - The **configuration partition** contains information about **the forest’s topology, including domain controllers and site links**. Every DC in a forest maintains a complete writable replica of the configuration partition.
  - **The schema partition** is a logical extension of the configuration partition; it contains **definitions of every object class in the forest and the rules that control the creation and manipulation of those objects**. Every DC in a forest maintains a complete replica of the schema partition. The schema partition is read-only on every DC except the DC that owns the Schema Master operations role for the forest.

## Configuring Global Catalog
- **When a new domain is created, the first DC will be made a global catalog server.**
-  To configure additional DCs as global catalog servers, either enable the Global Catalog checkbox in the server’s NTDS Settings properties in the Active Directory Sites and Services management console, or use the following PowerShell cmdlet:
```ps1
Set-ADObject -Identity (Get-ADDomainController -Server <SERVER>).NTDSSettingsObjectDN -Replace @{options='1'} 
```
- Each site in the forest should contain at least one global catalog server to eliminate the need for an authenticating DC to communicate across the network to retrieve global catalog information.
