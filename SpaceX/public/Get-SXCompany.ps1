function Get-SXCompany
{
    <#
    .SYNOPSIS
    Retrieve SpaceX Company data
    
    .DESCRIPTION
    Retrieve SpaceX Company data
    
    .EXAMPLE
    C:\PS> Get-SXCompany
    Gets the company data
    
    .NOTES
    https://github.com/lazywinadmin/SpaceX
    #>
[CmdletBinding()]
PARAM()
    If ($script:SecurityProtocolTweakRequired) {
        $originalSecurityProtocol = [Net.ServicePointManager]::SecurityProtocol
        
        [Net.ServicePointManager]::SecurityProtocol = ([Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12)
        Write-Verbose "Temporarily changing SecurityProtocol from [$originalSecurityProtocol] to [$([Net.ServicePointManager]::SecurityProtocol)]"
    }
    
    Invoke-RestMethod -Uri https://api.spacexdata.com/v3/info
    
    If ($script:SecurityProtocolTweakRequired) {
        [Net.ServicePointManager]::SecurityProtocol = $originalSecurityProtocol
        Write-Verbose "Resetting SecurityProtocol back to [$([Net.ServicePointManager]::SecurityProtocol)]"
    }
}