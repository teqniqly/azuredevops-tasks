# For more information on the Azure DevOps Task SDK:
# https://github.com/Microsoft/vsts-task-lib

[CmdletBinding()]
param()
Trace-VstsEnteringInvocation $MyInvocation
try {
    # Set the working directory.
    $packageJsonFolder = Get-VstsInput -Name packageJsonFolder -Require
    $major = Get-VstsInput -Name major -Require
    $minor = Get-VstsInput -Name minor -Require
    $patch = Get-VstsInput -Name patch -Require

    Write-Verbose "packageJsonFolder: '$packageJsonFolder'."
    Write-Verbose "major: '$major'."
    Write-Verbose "minor: '$minor'."
    Write-Verbose "patch: '$patch'."

    .\setNpmPackageVersion.ps1 -PackageJsonFolder $packageJsonFolder -Major $major -Minor $minor -Patch $patch
} finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
