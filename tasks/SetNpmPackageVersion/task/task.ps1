[CmdletBinding()]
param()
Trace-VstsEnteringInvocation $MyInvocation
try {
    $packageJsonFolder = Get-VstsInput -Name PackageJsonFolder -Require
    $major = Get-VstsInput -Name Major -AsInt -Require
    $minor = Get-VstsInput -Name Minor -AsInt -Require
    $patch = Get-VstsInput -Name Patch -AsInt -Require

    Write-Verbose "PackageJsonFolder: '$packageJsonFolder'"
    Write-Verbose "Major: '$major'."
    Write-Verbose "Minor: '$minor'."
    Write-Verbose "Patch: '$patch'."

    . $PSScriptRoot\functions.ps1

    Set-NpmPackageVersion -PackageJsonFolder $packageJsonFolder -Major $major -Minor $minor -Patch $patch
} finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
