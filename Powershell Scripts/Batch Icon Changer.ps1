Get-ChildItem -Directory | ForEach-Object {

Set-Location $_.Name

$TargetDirectory = Get-Location

$DesktopIni = @"
[.shellClassInfo]
IconResource = $TargetDirectory\icon.ico,0
"@

Add-Content "$($TargetDirectory)\desktop.ini" -Value $DesktopIni
(Get-Item "$($TargetDirectory)\desktop.ini" -Force).Attributes = 'Hidden, System, Archive'
(Get-Item $TargetDirectory -Force).Attributes = 'ReadOnly, Directory'
Write-Host "Completed"
Set-Location ..
}
pause
