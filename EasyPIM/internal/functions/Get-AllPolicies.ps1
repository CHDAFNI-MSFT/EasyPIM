﻿<#
      .Synopsis
       Retrieve all role policies
      .Description
       Get all roles then for each get the policy
      .Parameter scope
       Scope to look at
      .Example
        PS> Get-AllPolicies -scope "subscriptions/$subscriptionID"

        Get all roles then for each get the policy
      .Link

      .Notes
#>
function Get-AllPolicies {
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
  [CmdletBinding()]
  param (
      [Parameter()]
      [string]
      $scope
  )

    $ARMhost = Get-AzureEnvironmentEndpoint -EndpointType 'ARM'
    $ARMendpoint = "$($ARMhost.TrimEnd('/'))/$scope/providers/Microsoft.Authorization"
    $restUri = "$ARMendpoint/roleDefinitions?`$select=roleName&api-version=2022-04-01"

    write-verbose "Getting All Policies at $restUri"
    $response = Invoke-ARM -restURI $restUri -Method 'GET' -Body $null
    Write-Verbose $response
    $roles = $response | ForEach-Object {
        $_.value.properties.roleName
    }
    return $roles
}
