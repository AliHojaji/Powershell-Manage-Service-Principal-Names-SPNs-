#--- Author : Ali Hojaji ---#

#--*----------------------------------*--#
#---> Managed Service Accounts (MSA) <---#
#--*----------------------------------*--#

#--> Create a managed service account
New-ADServiceAccount -Name MSA-Testsrv -RestrictToSingleComputer
Add-ADComputerServiceAccount -Identity DC-Test1 -ServiceAccount MSA-Testsrv
Test-ADServiceAccount -Identity MSA-Testsrv

#--> Install MSA on local DC-TEST1
Install-ADServiceAccount MSA-Testsrv
Test-ADServiceAccount -Identity MSA-Testsrv

#--> Create a dummy service
New-Service -Name TESTSRV -BinaryPathName C:\Windows\System32\notepad.exe


##--> Group Managed Service Accounts (GMSA) <--#