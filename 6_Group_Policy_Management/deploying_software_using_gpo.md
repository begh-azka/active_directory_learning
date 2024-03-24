# Deployment using GPO
- Application Deployment can be done on a computer or for a user. For user, if they login to a different computer, all the applications will b
- Download an msi application from internet.
- Copy it from there to a new shared folder "Applications"
- Then in GPO, create a new policy object named "App-Deploy-FireFox", FireFox is the name of the app that we need to deploy.
- Edit and go to Computer Configuartion Software Settings -> Software Installation -> Right click -> New -> Package -> Open the **UNC/Network path** (/\\AD-SERVER-2\Applications') instead of the local path.
- We will get three options to deploy:
  1. Published: Only Available for User Configuration. Gives the user to install the software first.
  2. Assigned: To deploy the application without modification.
  3. Advanced: To deploy with modifications.
- Go with any option. Run **`gpupdate /force`**. Once group policy is installed, it will ask you to restart your server.
- Or you can manually restart using command **`shutdown -r -t 0`**
