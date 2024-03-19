# Group Policy Management
- It is a policy-based approach that can be applied to the whole organization or selectively applied to certain departments or groups in organizations.
- A tool used by IT Professionals (System Administrators, Help Desk, etc.) to Deploy Configuration Changes in AD quicky and easily to:
  - Users
  - Computers
- It is easy because we can make configurations in Group Policy **ONCE** and configure 1000s of computers.
- We can implement security configurations across our domain quicky and easily with the help of Group Policy.
- We can do things like
  - Restrict certain users from logging in to certain computers
  - Allow certain users to access some files
  - Give specific or all users a specific Desktop background
  - Deploy software to computers within our domain.

## How does Group Policy Work?
- Group Policy works by applying GPOs or Group Policy Objects to the OU structure that you have created.
- A GPO contains separate configuration settings for both computers and users.
- When a GPO is applied to an OU, the settings configured in the GPO are applied to the users and the computers that are within that OU.
- You can also configure the GPOs to only apply to certain objects by defining the security filtering.
- The most common choice is the authenticated users group which is basically any valid user or computer within AD.

### GPO Recursion
GPOs are applied recursively and this means that any setting that is applied to a parent OU or towards the domain will also apply to all sub OUs. 

## Create GP
- In the server Manager Tools, open Group Policy Management.
- Here we can see a forest containing our domain.
- There are multiple folders here:
  - **Domains**: Contains all the domains in our forest.
  - **Sites**: Contains all of your sites that you may have configured through Active Directory sites and services. (This is used when you have servers that are physically located in different locations.)
  - **Group Policy Modeling** and **Group Policy Results**: Tools used to troubleshoot any group policy issues.
  
