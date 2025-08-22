@{

# Script module or binary module file associated with this manifest.
RootModule = 'EasyPIM.psm1'

# Version number of this module.
ModuleVersion = '1.10.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '634875e7-f904-423d-a6b1-69132684321c'

# Author of this module
Author = 'Loïc MICHEL'

# Company or vendor of this module
#CompanyName = 'MyCompany'

# Copyright statement for this module
Copyright = '(c) loicmichel. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Manage PIM Azure Resource, PIM Entra role and PIM for Group settings and assignments with simplicity in mind'

# Minimum version of the PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @(
#     @{ModuleName = 'Microsoft.Graph.Authentication'; ModuleVersion = '2.10.0' },
#     @{ModuleName = 'Microsoft.Graph.Identity.Governance'; ModuleVersion = '2.10.0' },
#     @{ModuleName = 'Az.Accounts'; ModuleVersion = '2.13.0' }
# )
# Note: Dependencies are now checked via ScriptsToProcess with user-friendly warnings

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
ScriptsToProcess = @('internal\scripts\Import-ModuleChecks.ps1')

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    "Import-PIMAzureResourcePolicy",
    "Get-PIMAzureResourcePolicy",
    "Set-PIMAzureResourcePolicy",
    "Copy-PIMAzureResourcePolicy",
    "Export-PIMAzureResourcePolicy",
    "Backup-PIMAzureResourcePolicy",
    "Get-PIMAzureResourceActiveAssignment",
    "Get-PIMAzureResourceEligibleAssignment",
    "New-PIMAzureResourceActiveAssignment",
    "New-PIMAzureResourceEligibleAssignment",
    "Remove-PIMAzureResourceEligibleAssignment",
    "Remove-PIMAzureResourceActiveAssignment",
    "Get-PIMEntraRolePolicy",
    "Export-PIMEntraRolePolicy",
    "Import-PIMEntraRolePolicy",
    "Set-PIMEntraRolePolicy",
    "Backup-PIMEntraRolePolicy",
    "Copy-PIMEntraRolePolicy",
    "Get-PIMEntraRoleActiveAssignment",
    "Get-PIMEntraRoleEligibleAssignment",
    "New-PIMEntraRoleActiveAssignment",
    "New-PIMEntraRoleEligibleAssignment",
    'Remove-PIMEntraRoleActiveAssignment',
    'Remove-PIMEntraRoleEligibleAssignment',
    "Get-PIMGroupPolicy",
    "Set-PIMGroupPolicy",
    "Get-PIMGroupActiveAssignment",
    "Get-PIMGroupEligibleAssignment",
    'New-PIMGroupActiveAssignment',
    'New-PIMGroupEligibleAssignment',
    'Remove-PIMGroupActiveAssignment',
    'Remove-PIMGroupEligibleAssignment',
    'Show-PIMReport',
    'Get-PIMAzureResourcePendingApproval',
    'Approve-PIMAzureResourcePendingApproval',
    'Deny-PIMAzureResourcePendingApproval',
    'Get-PIMEntraRolePendingApproval',
    'Approve-PIMEntraRolePendingApproval',
    'Deny-PIMEntraRolePendingApproval',
    'Get-PIMGroupPendingApproval',
    'Approve-PIMGroupPendingApproval',
    'Deny-PIMGroupPendingApproval',
    'Copy-PIMAzureResourceEligibleAssignment',
    'Copy-PIMEntraRoleEligibleAssignment',
    'Invoke-EasyPIMOrchestrator',
    'Get-EasyPIMConfiguration',
    'Test-PIMPolicyDrift',
    'Test-PIMEndpointDiscovery'
)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
# CmdletsToExport = '*'

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
# AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @("Azure","PIM","EntraID","PrivilegedIdentityManagement")

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/kayasax/EasyPIM/blob/main/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/kayasax/EasyPIM/'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
    ReleaseNotes = @'
    v1.10.0 Release Notes:

    🌐 Multi-cloud Azure environment support (Chase Dafnis)
    - Enhanced Get-PIMAzureEnvironmentEndpoint for multi-cloud environments (Commercial, US Government, China, Germany)
    - Added comprehensive endpoint discovery and validation for all Azure cloud environments
    - Improved custom dependency management with Test-EasyPIMDependencies function

    🔧 Case-insensitive Entra role matching
    - Resolve roles ignoring case by listing roleDefinitions and matching locally
    - Removed unsupported Graph query params ($select/$top) to avoid BadRequest

    📦 Copy/csv robustness
    - Copy-PIMEntraRolePolicy: unique temp files and guarded cleanup (no more missing file errors)

    🔐 Auth Context consistency (follow-up to v1.9.1)
    - Always remove MFA from EndUser enablement when Authentication Context is enabled (Set-/Import- for Entra and Azure)

    🧹 Analyzer clean
    - PSAvoidGlobalVars and other rules pass across the affected scripts

    Contributors: Loïc MICHEL (original author), Chase Dafnis (multi-cloud / Azure environment support)
    Docs: https://github.com/kayasax/EasyPIM/wiki
'@

    # AdditionalReleaseNotes of this module
    # (Appended by fix/issue-121-followup)
    # AdditionalReleaseNotes removed; MFA is always removed when Authentication Context is enabled to avoid conflicts.

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/kayasax/EasyPIM/wiki/Documentation'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

