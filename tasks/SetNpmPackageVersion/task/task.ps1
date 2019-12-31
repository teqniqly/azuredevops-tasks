# For more information on the Azure DevOps Task SDK:
# https://github.com/Microsoft/vsts-task-lib

[CmdletBinding()]
param()
Trace-VstsEnteringInvocation $MyInvocation
try {
    $packageJsonFolder = Get-VstsInput -Name PackageJsonFolder
    $major = Get-VstsInput -Name Major -AsInt
    $minor = Get-VstsInput -Name Minor -AsInt
    $patch = Get-VstsInput -Name Patch -AsInt

    Write-Verbose "PackageJsonFolder: '$packageJsonFolder'"
    Write-Verbose "Major: '$major'."
    Write-Verbose "Minor: '$minor'."
    Write-Verbose "Patch: '$patch'."

    . $PSScriptRoot\functions.ps1
    #.\setNpmPackageVersion.ps1 -PackageJsonFolder $packageJsonFolder -Major $major -Minor $minor -Patch $patch
    Set-NpmPackageVersion -PackageJsonFolder $packageJsonFolder -Major $major -Minor $minor -Patch $patch
} finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
