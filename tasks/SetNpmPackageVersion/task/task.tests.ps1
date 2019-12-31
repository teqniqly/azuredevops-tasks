# Arrange
Import-Module $PSScriptRoot\ps_modules\VstsTaskSdk -ArgumentList @{ NonInteractive = $true }
Import-Module $PSScriptRoot\..\..\..\TestHelpers\TestHelpersModule\TestHelpersModule.psm1

. $PSScriptRoot\..\..\..\TestHelpers\Initialize-Test.ps1

Describe "Task input arguments tests" {
  It "Invokes 'Set-NpmPackageVersion' with expected arguments" {
    $variableSet = @{ PackageJsonFolder = "c:\foo"; Major = 10; Minor = 11; Patch = 12 }

    Unregister-Mock Get-VstsInput
    Unregister-Mock Set-NpmPackageVersion

    Register-Mock Get-VstsInput { $variableSet.PackageJsonFolder } -- -Name PackageJsonFolder -Require  
    Register-Mock Get-VstsInput { $variableSet.Major } -- -Name Major -AsInt -Require
    Register-Mock Get-VstsInput { $variableSet.Minor } -- -Name Minor -AsInt -Require
    Register-Mock Get-VstsInput { $variableSet.Patch } -- -Name Patch -AsInt -Require
    Register-Mock Set-NpmPackageVersion { "Package version updated." }

    # Act
    $output = & $PSScriptRoot\task.ps1

    # Assert
    $output | Should -Be "Package version updated."
    Assert-WasCalled Set-NpmPackageVersion -- -PackageJsonFolder $variableSet.PackageJsonFolder -Major $variableSet.Major -Minor $variableSet.Minor -Patch $variableSet.Patch

  }
}


Remove-Module "VstsTaskSdk"
Remove-Module "TestHelpersModule"