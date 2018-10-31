function Get-SXData
{
    <#
    .SYNOPSIS
    Retrieve data from the SpaceX API
    
    .DESCRIPTION
    Retrieve data from the SpaceX API
    
    
    
    .NOTES
    https://github.com/lazywinadmin/SpaceX
    #>
[CmdletBinding()]
PARAM($Path)
    If ($script:SecurityProtocolTweakRequired) {
        $originalSecurityProtocol = [Net.ServicePointManager]::SecurityProtocol
        
        [Net.ServicePointManager]::SecurityProtocol = ([Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12)
        Write-Verbose "Temporarily changing SecurityProtocol from [$originalSecurityProtocol] to [$([Net.ServicePointManager]::SecurityProtocol)]"
    }
    
    Invoke-RestMethod -Uri https://api.spacexdata.com/v3/$Path
    
    If ($script:SecurityProtocolTweakRequired) {
        [Net.ServicePointManager]::SecurityProtocol = $originalSecurityProtocol
        Write-Verbose "Resetting SecurityProtocol back to [$([Net.ServicePointManager]::SecurityProtocol)]"
    }
}