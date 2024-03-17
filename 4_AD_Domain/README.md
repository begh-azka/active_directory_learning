# Active Directory Domain
- **A domain is a collection of objects, including user accounts, computer accounts and groups.**
- It also serves as a replication boundary.
- A domain provides centralized administration.
- It provides centralized authentication.
- **A domain is represented by a DNS namespace**:
  -  abc.xyz serves as an example of a DNS namespace.
  -  Clients joined to the domain will have abc.xyz appended to the computer name. For example: SalesPC01 would have domain name of SalesPC01.abc.xyz
    
## Active Domain Forest
- A forest is a collection of one or more domains with two-way trust relationship between them.
- A forest shares a common Schema (Classes and Attributes)

### Create a user in a Domain
- Go to AD Users and Computers and there right click on Users. Click Create and fill the information.

### Domain Join
