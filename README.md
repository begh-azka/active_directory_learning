# Active Directory
### How to install AD using Powershell?

**Commands: To run as admin**

1. Enable ad-domain-services Role
   ```ps1
   install-WindowsFeature ad-domain-services
   ```
2. List all the Roles
   ```ps1
   Get-WindowsFeature
   ```
3. To promote the server to be a domain controller, SiteName by default 
   ```ps1
   Install-ADDSDomainController -DomainName abc.xyz -SiteName default-first-site-name -InstallDns
   ```

