## Defines the service name as a variable
$ServiceName = "Eventlog"

## Assigns a variable to a command that collects the service name
$ServiceInfo = Get-Service -Name $ServiceName

#Checks if the status is not running
if($ServiceInfo.Status -ne "Running"){
    
    #Displays the unactive services
    Write-Host "Service is not Running!!"

    ## Starts the service if it is not running
    Start-Service -Name $ServiceName

    ## Updates the $ServiceInfo to reflect that start up
    $ServiceInfo.Refresh()
    
    Write-Host $ServiceInfo.Status | Out-File -FilePath .\Documents\test.txt
    ## Displays the status of the started services

} else {## If status is already running, it will display a message detailing that it is already running.
    Write-Host "Service is already running"
}