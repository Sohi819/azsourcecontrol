#https://api-dogfood.resources.windows-int.net/subscriptions/1ee08c78-f3f6-4d1a-8e75-fd79dd7b4460/resourceGroups/jassinghrgdft1/providers/Microsoft.Automation/automationAccounts/jasscmklib/powershell7Modules/Empty - Copy?api-version=2019-06-01

# https://edge.management.azure.com/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourceGroups/jassinghRg/providers/Microsoft.Automation/automationAccounts/jassAaCmk/runbooks?api-version=2017-05-15-preview

# https://management.azure.com/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourceGroups/jassinghRg/providers/Microsoft.Automation/automationAccounts/jassAaCmk/runbooks/testPsRb?api-version=2017-05-15-preview


$subscriptionId = "cd45f23b-b832-4fa4-a434-1bf7e6f14a5a"
$ResourceGroupName = "jassinghRg"
$AutomationAccountName = "jassAa"
$RunbookName = "testPsRb14"
$Location = "centraluseuap"
$scriptContent = "Write-Output 'aa' `
   Write-Output 'bb'"


<# Invoke-AzRestMethod `
     -Method PUT `
     -SubscriptionId $subscriptionId `
     -ResourceGroupName $rgName `
     -ResourceProviderName Microsoft.Automation `
     -ResourceType automationAccounts `
     -Name $aaName/powershell7Modules/PSKubectl `
     -ApiVersion 2019-06-01 `
     -Payload '{"properties":{"contentLink":{"uri":"https://devopsgallerystorage.blob.core.windows.net/packages/pskubectl.0.13.0.nupkg"}}}'
	  #>
	 
# Invoke-AzRestMethod -Method "PUT" -SubscriptionId $subscriptionId -ResourceGroupName $ResourceGroupName -ResourceProviderName "Microsoft.Automation" `
   # -ResourceType "automationAccounts" -Name "${AutomationAccountName}/runbooks/${RunbookName}" -ApiVersion "2017-05-15-preview" `
   # -Payload "{`"properties`":{`"runbookType`":`"PowerShell7`",`"runbookType`":`"PowerShell7`",`"runbookType`":`"PowerShell7`", `"logProgress`":false, `"logVerbose`":false, `"draft`":{}}, `"location`":`"${Location}`"}"

# Invoke-AzRestMethod -Method "PUT" -SubscriptionId $subscriptionId -ResourceGroupName $ResourceGroupName -ResourceProviderName "Microsoft.Automation" `
   # -ResourceType automationAccounts -Name "${AutomationAccountName}/runbooks/${RunbookName}/draft/content" -ApiVersion 2015-10-31 `
   # -Payload $scriptContent


# Publish-AzAutomationRunbook -Name $RunbookName -AutomationAccountName $AutomationAccountName -ResourceGroupName $ResourceGroupName



$CompilationJob = Start-AzAutomationDscCompilationJob -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName -ConfigurationName 'MyDscConfiguration'

$CompilationJob

$CompilationJob.EndTime

$CompilationJob.Exception

$CompilationJob.StartTime

Write-Output "hello Going in "

#while($null -eq $CompilationJob.EndTime -and $null -eq $CompilationJob.Exception)
while($null -eq $CompilationJob.StartTime -or ($null -eq $CompilationJob.EndTime -and $null -eq $CompilationJob.Exception))
{
	Write-Output "hello loop in "
	$CompilationJob
	
    $CompilationJob = $CompilationJob | Get-AzAutomationDscCompilationJob
	
	Write-Output "going sleep.."
	
    Start-Sleep -Seconds 3
	
	Write-Output "waking from sleep.."
	
}

Write-Output "Out loop "
$CompilationJob
	
Write-Output "last step"

$CompilationJob | Get-AzAutomationDscCompilationJobOutput –Stream Any

