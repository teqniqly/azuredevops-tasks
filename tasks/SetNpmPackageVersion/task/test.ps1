# Inputs
$env:INPUT_PACKAGEJSONFOLDER = "c:\temp"
$env:INPUT_MAJOR = 10
$env:INPUT_MINOR = 11
$env:INPUT_PATCH = 12

Import-Module .\ps_modules\VstsTaskSdk -ArgumentList @{ NonInteractive = $true }
Invoke-VstsTaskScript -ScriptBlock ([scriptblock]::Create('. .\task.ps1'))
Remove-Module "VstsTaskSdk";