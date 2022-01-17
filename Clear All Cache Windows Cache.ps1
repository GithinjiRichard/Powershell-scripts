$host.ui.RawUI.WindowTitle = ìClear Windows Cacheî
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace(0xA)
$WinTemp = "c:\Windows\Temp\*"
write-Host "Cleanup task beginning..." -ForegroundColor Yellow
Sleep 2

#1# Remove Temp Files
write-Host "Removing Temp Files" -ForegroundColor Blue
Set-Location C:\Windows\Temp
Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue #Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue
sleep 1

Set-Location C:\Windows\Prefetch
sleep 1

#Set-Location 'C:\Users\%userprofile%\Document'
#C:\Documents and Settingsù Documents #C:\Users\RichardGithinji\Documents #C:\Users\%userprofile%\Documents
#Remove-Item .\*\Local Settings\temp\* -Recurse -Force -ErrorAction SilentlyContinue

Set-Location C:\Users
Remove-Item .\*\Appdata\Local\Temp\*ù -Recurse -Force -ErrorAction SilentlyContinue

sleep 1
write-Host "Temp Files removal complete" -ForegroundColor Green
sleep 1

#2# Empty Recycle Bin #
write-Host "Emptying Recycle Bin" -ForegroundColor Blue 
Clear-RecycleBin -DriveLetter C

sleep 1
write-host("Emptying Recycle Bin complete") -ForegroundColor Green
#}else if (($A No)){
 #  write-host("Emptying Recycle Bin Failed")-ForegroundColor Red
#}
Sleep 1

#3# Clearing Downloads Folder
write-Host "Clearing Downloads" -ForegroundColor Blue
Set-Location C:\Users
Remove-Item .*\Downloads\* -Recurse -Force -ErrorAction SilentlyContinue
write-Host "Clearing Downloads complete" -ForegroundColor Green


#4# Running Disk Clean up Tool 
write-Host "Running the Windows Disk Clean up Tool" -ForegroundColor Blue
cleanmgr /sagerun:1 | out-Null 
write-Host "Windows Disk Clean up Tool" -ForegroundColor Green

$([char]7)
Sleep 2
write-Host "Cleanup task complete" -ForegroundColor Yellow
Sleep 2
write-Host "script by_RG!!" -ForegroundColor Yellow
Sleep 2
##### End of the Script #####