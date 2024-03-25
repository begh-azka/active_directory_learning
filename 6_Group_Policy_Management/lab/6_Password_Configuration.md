# Configure Domain Password Requirements and Account Lockout

- In Group Policy Management, create a new GPO.
- Go to **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy**
- Here enable the below settings and change the value as you desire:
  - Minimum Password Age (0!)
  - Maximum Password Age (90!)
  - Minimum Password length (10)
  - Password Must Meet Complexity Requirements (one uppercase letter, a special character, a number etc)
- Next go to Account Lockout Policy in Account Policies and enable:
  - Account Lockout Duration (60 min or something)
  - Account Lockout Threshold (5 invalid logon attempts)
  - Reset Account Lockout Counter after (10 min)
- Go to **Security Settings -> Local Policies -> Security Options** and enable **Interactive Logon: Prompt User to change password before expiration** (14 days before)
- Finally, update GPO using cmd, run **`gpupdate /force`**
- On the next logon, changes will be effective.
