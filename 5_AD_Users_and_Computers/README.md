# Active Directory Users and Computers

- Also known as Active Directory or AD
- Found on any Windows Server with AD Domain Service
- It is a Database (or directory) that stores:
  - User Accounts
  - Computers
  - Printers
  - File Shares
  - Security Groups

### Security Groups
- User Accounts
- Computters
- Printers
- File Shares
- Other Groups

## Purpose of Active Directory
- Security Authentication
  - Only allow authorized users to logon to network computers
- Centralized security management of network resources
  - User accounts are stored in one place (AD) instead of each individual computer
      
### Most Common Tasks with AD
- Reset Passwords
- Create/delete user accounts

### Life without Active Directory
- Create user account for each user on individual computers
- Reset passwords on individual computers

## Organizational Units and Containers
### Containers
- Containers are structural objects that are included by default within Active Directory.
- The difference between OUs and containers is that you cannot apply Group Policy Objects (GPO) to containers.
- You cannot create a container within AD, although you could use ADSI edit to create a container if you needed it (Like when setting up SCCM).

1. **Computer Container**:
   - Computers is a container which is used as a default location for new computers that join your domain.
   - To apply GPO to any computer, you would have to move it to organizational unit (OU).
   - This will allow you to enforce your company's security policies like custom wallpapers etc.
     
2. **ForeignSecurityPrincipals**:
   - This container holds proxy objects for security principals from other trusted domain.
   - A security principal from another domain could be a user account or security group that resides inside of another domain.
   - Only used when we have established trust between two domains.
     
3. **Managed Service Accounts (MSA)**:
   - Holds accounts thatt are used to operate applications or services that run on your servers or your workstations.
   - Non-human accounts.
   - You do not create passwords for these accounts, they are handled automatically.
   - Rotating passwords for service accounts when they expire can be an issue for administrators. That is where MSAs help.
   - They resolve the issue by automating some of that for us.

4. **Users**:
   - Contains various users and security groups.
   - For disabled users, there is a downward arrow in an icon.
     
### Builtin
It is of the type builtinDomain. It contains Security Groups that are required for your domain to operate. You cannot delete builtin objects.

### Organizational Units
- Referred to as OUs, are used to organize and separate objects.
- Objects can be anything that Active Directory could store like user accounts, computers, printers, file shares or security grous.
- Example: If a company XYZ has an AD, they could create an OU called XYZ and manage all their computers, users, service accounts there.
- This way system administrators can assign specific permissions to OUs.
- There is a default OU: Domain Controllers
- You can create your own OU and create child OUs such as Computers, Users, Groups etc.

## Searching for Objects in Active Directory
- Click Find icon at the top and theN we can filter out groups and other objects.
- We can also perform operations on objects at the same time or use wildcards to filter.

## Resetting User Password
- Use **Find utility** for this to ensure you change password for the right account.
- As an added security, if there are multiple users with same name, then it is best to ask them their **logon** name (fname.lname@domain).
- You can use **advanced** tab and choose Users -> Logon name and enter the name the user gave you. This will quickly find the user and you can safely reset the password.
- Reset by right clicking on the user's name and then clicking Reset Password.

## 
- 
