 <#
  .SYNOPSIS
  Create scheduled task

  .SYNTAX
  Task-Generator.ps1 [[-TaskName <String>] [-WaitSeconds <Integer>]

  .DESCRIPTION
  Create scheduled task by using user's parameters such as: task name and how long the task will remain enabled.
  This script will execute first mytask.ps1 script which create file that contain string.
  The main task will open the file that has been created using notepad every 1 minute and print all enabled tasks.
  Task will be disabled after number of sceconds that has been set by the user.

  .PARAMETER TaskName
  Specifies the task name.
  
  .PARAMETER WaitSeconds
  Specifies number of seconds before task will be disabled.

  .EXAMPLE
  Task-Generator.ps1 -TaskName "MyCoolTaskName" -WaitSeconds "120"
#> 


param(
    [Parameter(Mandatory = $true)]
    $TaskName,
    $WaitSeconds
)

function Create-Task($TaskName) {
	$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'C:\mytask.ps1'
	$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)
	Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $TaskName
    Start-Sleep -Seconds $WaitSeconds
}

function Change-TaskStatus($TaskName) {
	if((Get-ScheduledTask | Where TaskName -eq $TaskName).State -eq "Ready" -or "Running") {
        Disable-ScheduledTask -TaskName $TaskName}
    else{
        Enable-ScheduledTask -TaskName $TaskName
        }
    }

function Get-AllTasks {
	Get-ScheduledTask | Where state -eq "Ready" | ft TaskName
}

Create-Task($TaskName)
Change-TaskStatus($TaskName)
Get-AllTasks

