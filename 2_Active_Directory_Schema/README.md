# Active Directory Schema
- Defines object **classes**
  - Users, computers, groups
- Defines **attributes**
  - Telephone numbers, address, name
    
## Schema Access
- Go to Run and enter "**mmc**" (Microsoft Management Console)
- This is where we can see the schema in File -> Add/Remove Snap-in
- If the schema is not visible, then we need to register a DLL file for it.
- Run cmd as an admin, enter **`regsvr32.exe schmmgmt.dll`**. This will register a DLL for the schema.
- Now go back to mmc and at the top left click File -> Add/Remove Snap-in. Here we will be able to see Active Directory Schema now.
- Click on it and then click Add and ok.
- Now we will be able to see classes and attributes. In classes, there is user. If we open its properties by right clicking, it shows all the attributes that are linked to a user.
- Some attributes like phone numbers, names, email addresses are replicated to the global catalog while as some such as accountexpires are not replicated.
- We can chnage our schema access to something else using GUI by right clicking Active Directory on the left and going to Operations Master.
- We can also use cmd to do that by running **`netdom query fsmo`**

## Modifying a Schema
- We can modify the schema by adding our own attributes.
- Go to mmc -> right click on attributes -> create
- Give a common name, object ID, Syntax (unicode string etc)
- Now you need to associate the attribute with a class.
- Right click a class and open its properties -> Attributes -> Add
- Now when we open Active Directory Users and Computers -> View -> Advanced Features, then open a user's properties, there will be a tab **Attribute Editor**. But we won't be able to see the new attributes if we have not restarted the Active Directory Service or the whole server.
