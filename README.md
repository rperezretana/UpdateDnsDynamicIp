# Update Godaddy's Dns Automatically when the dynamic ip changes

Update Godaddy Dns Automatically When dynamic Ip Change.

This is usefull when hosting gameservers at home or other small websites that can be down a few minutes once the IP changes.
It will save you the $120 or $240 a year of the static IP that your ISP charge you.

To use:
 - Update the 2 top variables at the file "1_CredentialsAndVariablesSetUp.ps1".
 - Update the file "UPDATE_WEBSITES.ps1" where it says "{PATH WHERE YOU WILL SAVE THIS FILES}".
 - If you intent to run the batch file update the "{PATH WHERE YOU WILL SAVE THIS FILES}" too.
 - Run it from the server or a computer in the same network, since it will try to get the new IP of your computer/server to update GoDaddys DNS.
 
 Schedule the task using the batch or the Ps1.
