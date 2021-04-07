# Create a new task action
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "C:\Users\ahovel\Desktop\learning\udemy\bootCamp\project2\firstScript.ps1" # Specify what program to run and with its parameters'

# Create a time threshold for the trigger(in our case every 1 min). 
$frequencyInMin = 1
$params = @{
    Once = $true
    At = (Get-Date)
    RepetitionInterval = (New-TimeSpan -Minutes $frequencyInMin)
    RepetitionDuration = (New-TimeSpan -Days (365 * $frequencyInMin)) 
}

# Create a new trigger (based on the parameters)
$trigger =  New-ScheduledTaskTrigger @params


# The name of your scheduled task given by the user.
$taskName = Read-Host -Prompt 'Input your task  name'


# Describe the scheduled task.
$description = "printing a apesific text to a notepad file"

# Set of settings.
$settings = New-ScheduledTaskSettingsSet

# Register the new PowerShell scheduled task
Register-ScheduledTask -Action $action -TaskName $taskName -Trigger $trigger -Settings $settings -Description $description

$Timeout = Read-Host -Prompt 'Input time in seconde to disabe the task' #just change the timeout here

Write-Output "Full list of tasks :"
Start-Sleep -s 2
Get-ScheduledTask | Select-Object TaskName
$ProgressPreference = 'SilentlyContinue' 
Start-Sleep -s $Timeout


Disable-ScheduledTask -TaskName $taskName 
$ProgressPreference = 'Continue'
