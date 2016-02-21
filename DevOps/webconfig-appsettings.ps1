param(
[string]$tagstring
)

$webConfig = '**\Tailspin.WebUpgraded\Web.config'
$doc = (Get-Content $webConfig) -as [Xml]
$obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'iKey'}
$obj.value = 'bb2f698c-c81a-4224-9d13-39fbf4f39452'
$obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'tags'}
$obj.value = $tagstring
$doc.Save($webconfig)