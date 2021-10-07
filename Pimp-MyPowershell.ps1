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

Write-Host "Downloading Color Tool"
Invoke-WebRequest -Uri "https://github.com/microsoft/terminal/releases/download/1904.29002/ColorTool.zip" -OutFile ".\ColorTool.zip"
Expand-Archive -Path ".\ColorTool.zip" -DestinationPath ".\"
Write-Host "Color Tool setup complete"

Write-Host "Building Profile"
$profileContent = @"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons
Set-PoshPrompt -Theme $poshTheme
$PSScriptRoot\ColorTool.exe -q solarized_dark.itermcolors
"@

Set-Content $PROFILE $profileContent
Write-Host "Profile complete"

Write-Host "Finished! Please install a compatible nerd font and set it in your powershell console settings. https://github.com/ryanoasis/nerd-fonts"