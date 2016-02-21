param($websiteName, $websiteSlotName, $sqlConnectionStringName, $sqlDatabaseServerName, $sqlDatabaseName, $sqlUserName, $sqlPassword)

Function Get-SQLAzureDatabaseConnectionString
{
    Param(
        [String]$DatabaseServerName,
        [String]$DatabaseName,
        [String]$UserName,
        [String]$Password
    )

    Return "Server=tcp:$DatabaseServerName.database.windows.net,1433;Database=$DatabaseName;User ID=$UserName@$DatabaseServerName;Password=$Password;Encrypt=True;Connection Timeout=30;"
}

$databaseConnectionString = Get-SQLAzureDatabaseConnectionString -DatabaseServerName $sqlDatabaseServerName -DatabaseName $sqlDatabaseName -UserName $sqlUserName -Password $sqlPassword

$connectionStrings = ( `
    @{Name = $sqlConnectionStringName; Type = "SQLAzure"; ConnectionString = $databaseConnectionString} `
)


Set-AzureWebsite -Name $websiteName -Slot $websiteSlotName -ConnectionStrings $connectionStrings
