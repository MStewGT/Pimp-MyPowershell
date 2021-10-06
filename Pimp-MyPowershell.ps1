[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet("agnoster","jandedobbeleer","paradox")]
    $poshTheme
)

Write-Host "Installing Modules"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
Install-Module -Name posh-git -Scope CurrentUser -Force -AllowClobber
Install-Module -Name oh-my-posh -Scope CurrentUser -Force -AllowClobber
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -AllowClobber
Write-Host "Module installation complete"

Write-Host "Building Profile"
$profileContent = @"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons
Set-PoshPrompt -Theme $poshTheme
"@

Set-Content $PROFILE $profileContent
Write-Host "Profile complete"

Write-Host "Finished! Please install a compatible nerd font and set it in your powershell console settings. https://github.com/ryanoasis/nerd-fonts"