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
- To join a server to this domain make sure you change its network settings:
  - Right click network icon on taskbar -> go to network -> ethernet -> ipv4 -> static ip
  - Before you enter static IP, open cmd and type **ipconfig/all** and copy IPv4 address from there along with subnet mask and default gateway.
  - For DNS server, paste the IPv4 address of Domain Controller server. Validate the settings.
- Right click windows icon, and go to system -> Click change settings
- There click on domain radio button. Enter your domain. If network settings are correct, it will prompt you to enter credentials.
- Enter the credentials of administrator of Domain Controller.
- It should give you a success message.
