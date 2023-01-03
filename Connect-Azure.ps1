<#
.SYNOPSIS
.DESCRIPTION
.PARAMETER NAME
.INPUTS
.OUTPUTS
.LINK
.EXAMPLE
.NOTES
    VERSION:        2.0
    AUTHOR:         Alexandru Lacraru
    EMAIL:          alexandru.l.lacraru@pwc.com
    CREATION DATE:  16 May 2020
    LAST EDIT:      25 Oct 2022
    CHANGES:
#>

workflow Connect-Azure {

    if ($env:MSI_SECRET) {

        $automationAccountSubscription = Get-AutomationVariable -Name 'automationAccountSubscription'
        Disable-AzContextAutosave -Scope Process | InlineScript { Out-Null }
        Connect-AzAccount -Identity | InlineScript { Out-Null }
        Set-AzContext $automationAccountSubscription | InlineScript { Out-Null }

    }

}