<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.156
	 Created on:   	5/30/2019 12:50 PM
	 Created by:   	Thaddeus Pearson
	 Organization: 	
	 Filename: networkHammer    	
	===========================================================================
	.DESCRIPTION
		PowerShell nmap utility 
#>

# install nmap module

Install-Module -Name PSnmap -Scope CurrentUser

$writeCred = Get-Credential

# gather information for the desired network scan function

$targetNetwork = Read-Host "Enter target network in the following format: x.x.x.x/x"

$saveDataFileName = Read-Host "Enter the filename for output data"

#$saveData = Get-SaveData
#
#Function Get-SaveData($targetDirectory)
#{
#	[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
#	
#	$foldername = New-Object System.Windows.Forms.OpenFileDialog
#	
#	if ($foldername.ShowDialog() -eq "OK")
#	{
#		$folder += $foldername.FileNames
#	}
#	return $folder
#}
#
#
#Write-Host $saveData
#
#Get-SaveData

$testPathBool = Test-Path -Path "$env:TEMP"

if ($testPathBool = "True") { Write-Host "C:\Temp exists, proceeding with scan" }
else { New-Item -Path "$env:TEMP" -Credential $writeCred }


# (Get-VM | out-file -encoding unicode "c:\vm\$H_VMs.txt")



# "$env:temp\report$(Get-Date -Format yyyyMMddHHmmss).csv"




# execute the nmap scan function using the collected information

invoke-psnmap -Cn $targetNetwork -verbose -Dns -AddService | Export-Csv -Path "$env:TEMP\$saveDataFileName.csv" -NoTypeInformation

# use the information outputted from the nmap network scan for the user in a presentable, savable form

Invoke-Item -Path "$env:TEMP\$saveDataFileName.csv"

# ask if the user wants to scan another network



# use an if then block to handle execution of additional network scans using the nmap function 



# exit the application 
