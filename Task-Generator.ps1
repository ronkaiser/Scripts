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

