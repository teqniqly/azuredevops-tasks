<#
    .Synopsis
    Sets the package version in package.json.

    .Description
    This script sets the package version in the package.json with the given major, minor, and patch values. The version is of the form major.minor.patch.
    The script assumes only one package.json file exists in the folder.

    .Parameter PackageJsonFolder
    The folder containing the package.json to update.

    .Parameter Major
    The major package value.

    .Parameter Minor
    The minor package value.

    .Parameter Patch
    The patch package value.

    .Example
        # Set the package version to 1.2.5. The package.json is contained in the Foo/Bar/Api folder.
        Set-NpmPackageVersion -PackageJsonFolder "Foo/Bar/Api" -Major 1 -Minor 2 -Patch 5 
#>
param(
        [Parameter(Mandatory=$true)]
        [string] $PackageJsonFolder,
        
        [Parameter(Mandatory=$true)]
        [int] $Major,

        [Parameter(Mandatory=$true)]
        [int] $Minor,

        [Parameter(Mandatory=$true)]
        [int] $Patch
    )

$filePath = join-path -Path $PackageJsonFolder -ChildPath package.json
$file = get-childitem -File $filePath
$file.attributes = 'Normal'

$filecontent = Get-Content $filePath -Raw | ConvertFrom-Json
$filecontent.version =  "$Major.$Minor.$Patch"
$filecontent | ConvertTo-Json -Depth 32 | Set-Content -Path $filePath