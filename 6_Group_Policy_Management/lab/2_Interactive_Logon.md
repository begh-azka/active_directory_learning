# Setting up Logon Banner

- Go to Group Policy Management Tool and create a new GPO at domain level named "Interactive-Logon"
- Then edit it and go to **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Security Options**
- Finally, select **Interactive logon: Message tile and Message text** (2 different settings).
- In message tile, enter something like "CAUTION!" and in message text enter "Only Authorized Users Allowed."
- Save and type **`gpupdate`** and sign out.
- On the next login, user will be able to see the tile and the message as well.
