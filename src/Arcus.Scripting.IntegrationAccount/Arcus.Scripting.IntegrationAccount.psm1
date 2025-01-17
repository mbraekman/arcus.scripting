<#
 .Synopsis
  Upload/update a single, or multiple schemas into an Azure Integration Account.
 
 .Description
  Provide a file- or folder-path to upload/update a single or multiple schemas into an Integration Account.

 .Parameter ResourceGroupName
  The name of the Azure resource group where the Azure Integration Account is located.
 
 .Parameter Name
  The name of the Azure Integration Account into which the schemas are to be uploaded/updated.

 .Parameter SchemaFilePath
  The full path of a schema that should be uploaded/updated.
  
 .Parameter SchemasFolder
  The path to a directory containing all schemas that should be uploaded/updated.

 .Parameter ArtifactsPrefix
  The prefix, if any, that should be added to the schemas before uploading/updating.

 .Parameter RemoveFileExtensions
  Indicator whether the extension should be removed from the name before uploading/updating.
#>
function Set-AzIntegrationAccountSchemas {
    param(
        [Parameter(Mandatory = $true)][string] $ResourceGroupName = $(throw "Resource group name is required"),
        [Parameter(Mandatory = $true)][string] $Name = $(throw "Name of the Integration Account is required"),
        [parameter(Mandatory = $false)][string] $SchemaFilePath = $(if ($SchemasFolder -eq '') { throw "Either the file path of a specific schema or the file path of a folder containing multiple schemas is required, e.g.: -SchemaFilePath 'C:\Schemas\Schema.xsd' or -SchemasFolder 'C:\Schemas'" }),
        [parameter(Mandatory = $false)][string] $SchemasFolder = $(if ($SchemaFilePath -eq '') { throw "Either the file path of a specific schema or the file path of a folder containing multiple schemas is required, e.g.: -SchemaFilePath 'C:\Schemas\Schema.xsd' or -SchemasFolder 'C:\Schemas'" }),
        [Parameter(Mandatory = $false)][string] $ArtifactsPrefix = '',
        [Parameter(Mandatory = $false)][switch] $RemoveFileExtensions = $false
    )

    if($RemoveFileExtensions) {
        . $PSScriptRoot\Scripts\Set-AzIntegrationAccountSchemas.ps1 -ResourceGroupName $ResourceGroupName -Name $Name -SchemaFilePath $SchemaFilePath -SchemasFolder $SchemasFolder -ArtifactsPrefix $ArtifactsPrefix -RemoveFileExtensions
    } else {
        . $PSScriptRoot\Scripts\Set-AzIntegrationAccountSchemas.ps1 -ResourceGroupName $ResourceGroupName -Name $Name -SchemaFilePath $SchemaFilePath -SchemasFolder $SchemasFolder -ArtifactsPrefix $ArtifactsPrefix
    }
}

Export-ModuleMember -Function Set-AzIntegrationAccountSchemas
