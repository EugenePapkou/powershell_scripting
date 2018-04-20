[CmdletBinding()]
param 
(
    [parameter(mandatory = $false)]
    [system.string]$location = "C:\1.txt"
)

Get-Process | select processname, TotalProcessorTime | sort TotalProcessorTime -Descending | select * -First 10 | Out-File $location
Get-Content $location

$t = New-JobTrigger -RepetitionInterval (New-TimeSpan -minute 10) -Once -At 09:26PM -RepeatIndefinitely
$cred = Get-Credential WIN-1JJMS28DH6C\administrator
$o = New-ScheduledJobOption -RunElevated
Register-ScheduledJob -Name task_3.1_4.0 -FilePath C:\script3.ps1 -Trigger $t -Credential $cred -ScheduledJobOption $o