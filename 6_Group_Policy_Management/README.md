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

### How does Group Policy Work?
- Group Policy works by applying GPOs or Group Policy Objects to the OU structure that you have created.
- A GPO contains separate configuration settings for both computers and users.
- When a GPO is applied to an OU, the settings configured in the GPO are applied to the users and the computers that are within that OU.
- You can also configure the GPOs to only apply to certain objects by defining the security filtering.
- The most common choice is the authenticated users group which is basically any valid user or computer within AD.

### GPO Recursion
GPOs are applied recursively and this means that any setting that is applied to a parent OU or towards the domain will also apply to all sub OUs. 

## Group Policy Management Tool
- In the server Manager Tools, open Group Policy Management.
- Here we can see a forest containing our domain.
- There are multiple folders here:
  - **Domains**: Contains all the domains in our forest. 
  - **Sites**: Contains all of your sites that you may have configured through Active Directory sites and services. (This is used when you have servers that are physically located in different locations.)
  - **Group Policy Modeling** and **Group Policy Results**: Tools used to troubleshoot any group policy issues.
- GPOs can be applied to local (local computer), Sites, Domains and OUs.
  
### Folders
- In Domains, there is our domain and inside it:
  - Default Domain Policy: This is a GPO that comes by default when a new domain is created.
  - Domain Controllers: OU
  - Our OUs
  - Group Policy Objects
  - WMI Filters
  - Starter GPOs
  
## Create and Link Group Policy Objects (GPOs)
- **Method 1:**
  - Right click your **domain** and select "Create a GPO in this domain and Link it here"
  - If we follow the first way, then a GPO and a link is created.
  - GPO will be under Group policy Objects folder and link will be directly under the domain.
- **Method 2:**
  - Right click **Group Policy Objects** and click New.
  - If we follow the second way, then a GPO is created but a link will not be created.
  - To link it, right click the domain and select "Link existing GPO"
  - This way, we can also link one existing GPO to multiple OUs.
- We can edit a GPO, change it to enforced (it will take precedence over other GPOs)
- We can also check whether link is enabled or not by right clicking.
- Renaming or Deleting a link will rename/delete GPO's name as well.
- GPO has multiple tabs like Scope, Details, Settings and Delegation. In Settings, we can set user or computer level configuration.
- In Delegation, we can add or remove users and give them permissons such as edit, read etc. to the GPOs (Rarely Used).
- **When we link a GPO to an OU, the policy applies to all the users or computers within that OU.**

### EDIT a GPO
- When you right click a GPO, there is an option to edit.
- It will open a different window. Two options are there:
  - **Computing Configuration**
  - **User Configuration**
- Both contain two folders:
  - **Policies**
  - **Preferences**
- Policies contains about 2500 different settings.
  - **Example**: Administrative Templates -> System -> Device Installation -> Device Installation Restrictions  -> Enable or Disable any policy
- When we enable or disable a setting inside a policy, it can be seen in policy management -> OU -> GPO -> Settings -> Computer or user (whichever you applied) 

### Group Policy Precedence
- Below is the order of precedence of Group Policy from lowest to highest (**LSDOE**):
  - Local (gpedit.msc in run will open local policies)
  - Sites
  - Domain
  - Organizational Unit
  - Sub-Organizational Unit
  - Enforced GPOs
    
- Any policy applied to an OU will take precedence over others. So if some setting is disabled in a policy for OU and the same policy's setting is enabled in Domain, then OU one will take higher priority.
- Last applied policy always wins!

- **Computer vs User:**
  - Computer Configuration   (assume...applied first)  (Least Important)
  - User Configuration       (assume...applied last)   (Most Important)
- The setting that is applied last wins!

### Blocked Inheritance
- If an Organizational Unit has enabled Block Inheritance then all the policies that are at above level (higher than OU) will be blocked except Enforced.
- Only GPOs inside the OU will apply.
- We can enable it by right clicking an OU in Group policy Management.

### Security Filtering
- It allows us to apply group policy to groups or users specifically.

### WMI (Windows Management Instrumentation) Filtering
- It lets us create a script in Windows Query Language (WQL).
- A WMI Filter lets us evaluate software and hardware on a computer before a setting applies.
- Example: If we wanted to apply a setting to a computer only when it had 50 gb of RAM and ran windows 10, then WMI Filter would be used.

## Troubleshooting Group Policy Issues
### Resultant Set of Policies
- Enter **`rsop.msc`** in run. It will open **Resultant Set of Policies** of the currently logged in user.
- This looks similar to Group Policy Management tool.
- This can be used to check what is going on with user's policies.
  
### CMD
- Type **`gpresult /r`** and it prints output of all the policies that are applied to current user. It also shows which policy objects are applied along with what groups user is a part of.
- If you updated a policy at domain or any other level and you want to check updated **Resultant Set of Policies**, run **`gpupdate`**
- Users can only see their own policies (user policy objects). Opening cmd as an admin lets user check computer policy objects as well.
- To force update, type **`gpupdate /force`**
