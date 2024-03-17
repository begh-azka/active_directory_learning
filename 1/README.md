# Basic Active Directory Terms

1. **Domain**: Collection of Objects (user accounts, computers, groups and more)
2. **Domain Controller**: Server with Active Directory installed.
3. **Tree**: Collection of Domains (RTS.local -> Parent Domain and abc.RTS.local -> Child Domain)
4. **Forest**: Collection of Trees (Two or more Trees combined)
5. **Global Catalog**: Used in an address book while using MS Outlook.
6. **DNS**: Resolves an name to an IP Address.


## Steps to Install AD on a Windows Server:
- Login to the server and open Server Manager.
- There, select computer name: We can change the name of the server and add it to a domain as well.
- In the ethernet option, it will say IPv4 address assigned by DHCP and IPv6 enable. This is not what we need. We need to have a static IP address. Click IPv4 option and open the properties. (Optional)
- Enter an IP like 192.13.0.10 and in DNS keep it similar, DNS can also be 127.0.0.1 which is a loopback address. (Optional)
- Go to Manage at the top right, click on **Add Roles and Features**.
- Select Role Based or Feature Based installation. Here we need Role.
- Select your server from server pool.
- Then there will be a list of roles that we can install.
- **Active Directory Domain Service** Role is the one that is required to create a **Domain Controller**. On clicking it, a box with more features pops up. These are tools that will be installed for remote server administration. Click Add Features.
- In Features, no selections are needed.
- In AD DS (Active Directory Domain Services), you get info about AD.
- Finally confirm and install.
- This will install the binary/setup files of the role, but we still need to configure it.
- When the wizard shows installation complete, click **Promote this server to Domain Controller** or if you exited the wizard, go to notifications in top right.
- Here we get three options:
  - Add domain controller to existing domain
  - Add a new domain to an existing domain
  - Add a new forest
- We will go with new forest as we don't have an existing domain. Create a domain name (abc.xyz) and then in the functional area, keep oldest possible OS.
- Here we are using 2016 which means all the servers in this domain would have to be 2016 or newer than that.
- Now choose a **DSRM** (Directory Service Restore Mode) password. If Active Directory needs to be restored, say from maybe a backup, if you were to delete an object or anything like that, you can reboot your domain controller as you reboot. This can be different across different AD servers. It needs to be well documented for future use.
- To reset it, use **ntds utils** command.
- Once Active directory is installed, **DNS** will be installed as well.
- Next, NETBIOS name will be installed. This is your domain without the extension, so abc.
- Keep paths as default.
- The installation can fail if administrator password has not been set. To set it run **net user administrator** in powershell and set a password.

### Verify Installation was successful after reboot
- In server manager, on the top right, is an option Tools. There will be a lot of options like DNS, Event Viewer, Active Directory Administrative Center, Group Policy etc.
- One of them will be Active Directory Users and Computers. This will be our main area of administration.
- Open this tool and it will take you to a new window where you will be able to see your domain (abc.xyz). Expand it and you will see options like Builtin, Computers, Domain Controllers, Foreign Security Principals, Keys, Managed Service Accounts and **Users**.
- Event Viewer will show you logs. Go to Application and Services Logs -> Directory Service and here you will be able to see logs related to AD.
- In DNS tool, if we go to server-name -> Forward Lookup Zones -> _msdcs.domain-name -> dc -> _tcp, we will find two records: Kerberos and Ldap. Both of these are Service Location (SRV).All of our domain controllers will have them.
- Go to Run and type \\server-name and it should show two folders that are shared.
  - netlogin
  - sysvol
- The **netlogon** just runs log on service that authenticates when users actually attempt to login.
- **sysvol** folder contains a folder with the same name as our domain. Inside there are Policies and scripts.
