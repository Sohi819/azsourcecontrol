workflow jassPSw2 { 
	# Converter: Wrapping initial script in an InlineScript activity, and passing any parameters for use within the InlineScript
    # Converter: If you want this InlineScript to execute on another host rather than the Automation worker, simply add some combination of -PSComputerName, -PSCredential, -PSConnectionURI, or other workflow common parameters (http://technet.microsoft.com/en-us/library/jj129719.aspx) as parameters of the InlineScript
    inlineScript {
        Write-Output "Hello, World"
    }

}