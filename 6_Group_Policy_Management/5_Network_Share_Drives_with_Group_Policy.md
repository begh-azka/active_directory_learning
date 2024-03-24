# How to Automatically Map a Network Share Drive with Group Policy?

- In ADUC, create Global security groups within your OU: Group-A and Group-B
- Add User-A to Group-A and User-B to Group-B
- Next create a Shared Folder (Folder-A and B) for each of these User Groups.
- In file manager, at the top, click **Computer** and then click **Map Network Drive**
- But instead of doing it here, we will do it automatically with Active Directory.
- Right click your OU or your domain (if you want), click New and select **Shared Folder**
- Give it a name (Folder-A) and in network path paste  to which Group-A has access
