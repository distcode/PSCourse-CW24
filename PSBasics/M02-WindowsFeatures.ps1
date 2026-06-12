
# Windows Features - windows 10/11

## Get Windows optional features
Get-WindowsOptionalFeature -Online

## Enable optional features
Enable-WindowsOptionalFeature -FeatureName TFTP

## Get RSATs
Get-WindowsCapability -Online

## Install RSAT for AD
Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
## !!! ATTANTION - lasting very, very, very long ... > 15 minutes !!!


# Windows Features - Windows Server

Get-WindowsFeature
Get-windowsFeature | Where-Object { $_.Installed }

Install-WindowsFeature -Name NLB -IncludeManagementTools

