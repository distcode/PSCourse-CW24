
# Jobs
## BackgroundJobs - RemoteJob - ScheduledJobs - [Workflowjobs]

# BackgroundJob
Start-Job -Name Windir -ScriptBlock { Get-ChildItem C:\Windows\ -Recurse }
Get-Job

Start-Job -Name Windir -ScriptBlock { Get-ChildItem HKLM:\SYSTEM\CurrentControlSet\Services\  }
Get-Job
Receive-Job -Id 3 -Keep
Receive-Job -Id 3 -Keep | Get-Member
Receive-Job -Id 3 

# often nescesary to wait for all jobs in a script
Get-Job | Wait-Job

# RemoteJob
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-ChildItem HKLM:\SYSTEM\CurrentControlSet\Services\ -Recurse } -AsJob
Get-Job
Receive-Job -Id 1 | Select-Object -First 10
Get-Job # note HasMoreData has the value false !!!

Invoke-Command -ComputerName dc1,srv1,cl1 -ScriptBlock { Get-Process; Start-Sleep -Seconds 10 } -AsJob
Get-Job
Get-Job -IncludeChildJob

# also BackgroundJobs have a child job
Start-Job -ScriptBlock { Get-Process; Start-Sleep -Seconds 10 }
Get-Job -IncludeChildJob

# ScheduledJobs
Get-Command -noun *schedule* -verb get
compmgmt.msc

Get-Command -noun *scheduledjob*
Get-Command -noun *trigger*
$trigger = New-JobTrigger -At (Get-Date -Hour 14 -Minute 23 -Second 0 -Millisecond 0) -Once 
$trigger
$options = New-ScheduledJobOption -RequireNetwork
Register-ScheduledJob -FilePath C:\PSScripts\Script01.ps1 -Name sWAT-PSJob01 -Trigger $trigger -ScheduledJobOption $options 

# wait for ScheduledJob run ...
Get-Job
Receive-Job -Id 'anyValidId' -Keep

# Working with parameters/variables
$seconds = 5
Start-Job -name Parameterjob3 -ScriptBlock {Get-Service b* ; "Es wird $using:seconds Sekunden gewartet ..." ; Start-Sleep -Seconds $using:seconds }
Get-Job
Get-Job -id 14 | Receive-Job -Keep
