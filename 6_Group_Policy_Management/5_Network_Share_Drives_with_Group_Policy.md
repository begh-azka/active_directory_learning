# How to Automatically Map a Network Share Drive with Group Policy?

- In ADUC, create Global security groups within your OU: Group-A and Group-B
- Add User-A to Group-A and User-B to Group-B
- Next create a Shared Folder (Folder-A and B) for each of these User Groups.
- In file manager, at the top, click **Computer** and then click **Map Network Drive**
- But instead of doing it here, we will do it automatically with Active Directory.
- Right click your OU or your domain (if you want), click New and select **Shared Folder**
- Give it a name (Share-A) and in network path paste Folder-A's path and so on.
- Now go to Group Policy Management, create a GPO at domain level or your OU. Name it Group-A-mapped-drive and so on.
- Edit and go to User Configuration -> Preferences -> Windows Settings -> Drive Maps
- Right click and select New -> Mapped Drive
- Location: Share-A or Share-B
- Check Reconnect box. So that every time user logs in, it is available.
- Drive Letter: Use First Available Starting at **A**
- Go to Scope tab of the same GPO and in **Security Filtering**, remove Authenticated Users and Add Group-A.
- This Security Filtering prevent wrong users from accessing wrong file shares.
- Finally, give Authenticated Users Read only permission in Delegation tab of each GPO.
