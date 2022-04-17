#connecting to the Azure AD
Connect-AzureAD

#importing the CSV source which has the changes
$data = Import-Csv E:\Projects\Bulk-Update\Roster3.csv

#Iterating through each row in the CSV
foreach ($row in $data)
{
#INFO in the Console
Write-Host "Updating the user :" $row.'User Username' "Manager" -ForegroundColor Yellow
#Updating the Manager
Set-AzureADUserManager -ObjectId (Get-AzureADUser -ObjectId $row.'User Username').Objectid -RefObjectId (Get-AzureADUser -ObjectId $row.'Manager Username').Objectid

#INFO in the Console
Write-Host "Updating " $row.'User Username'"s' infor" -ForegroundColor Yellow
Set-AzureADUser -ObjectId (Get-AzureADUser -ObjectId $row.'User Username').Objectid -Department ($row.'Department') -JobTitle ($row.'JobTitle') -PhysicalDeliveryOfficeName ($row.'PhysicalDeliveryOfficeName')

#Completion info in the console for the specified row
Write-Host "updated." -ForegroundColor Green

}
Write-Host "...Update complete..." -ForegroundColor Green
