Write-Host  -ForegroundColor Cyan "Starting American Safety Council's Custom OSDCloud ..."
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
<#
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}
#>

# sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating the OSD PowerShell Module"
Install-Module OSD -Force
Write-Host  -ForegroundColor Cyan "Importing the OSD PowerShell Module"
Import-Module OSD -Force

# Start OSDCloud ZTI
Write-Host  -ForegroundColor Cyan "Start OSDCloud with Pre-Defined Values"
Start-OSDCloud -Screenshot -OSLanguage en-us -OSVersion 'Windows 10' -OSBuild 21H2 -OSEdition Pro -ZTI

# Post Actions
# Write-Host  -ForegroundColor Cyan "Starting OSDCloud PostAction ..."
# Write-Warning "I'm not sure of what to put here yet"

# Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
