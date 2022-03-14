#connecting to the Azure AD
Connect-AzureAD



#importing the CSV source which has the changes
$data = Import-Csv E:\Projects\Bulk-Update\Roster2.csv



#Iterating through each row in the CSV
foreach ($row in $data)
{
#INFO in the Console
Write-Host "Updating the user :" $row.'User Username' " manager to " $row.'Department' $row.'JobTitle' $row.'PhysicalDeliveryOfficeName' -ForegroundColor Yellow



#Updating the Manager
Set-AzureADUser -ObjectId (Get-AzureADUser -ObjectId $row.'User Username').Objectid -Department ($row.'Department') -JobTitle ($row.'JobTitle') -PhysicalDeliveryOfficeName ($row.'PhysicalDeliveryOfficeName')



#Completion info in the console for the specified row
Write-Host "Updated." -ForegroundColor Green

}
