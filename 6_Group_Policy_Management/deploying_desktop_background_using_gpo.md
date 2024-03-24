# Deploying a Custom Desktop Background to your domain with a GPO

1. This will be a user configuration.
2. Create a File Share, put the background there and make sure all authenticated users can access the share.
3. To create a File Share, first create a folder and open its properties.
4. In the properties, click on Advanced Sharing and hit Permissions. Instead of Everyone give Authenticated Users Read access.
5. In the properties, a network path will be visible. To verify the creation of the file share, open run and go to that location. It should open and the desktop background should be available there.
