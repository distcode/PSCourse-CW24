
# Working with Windows Eventlogs

# get all eventlog
Get-EventLog -List

# get events of an eventlog
Get-EventLog -LogName Application

# some usefull parameter to filter the list of events
Get-EventLog -LogName Application -Newest 5
Get-EventLog -LogName Application -EntryType Warning,Error
Get-EventLog -LogName Application -InstanceId <anyEventID>
Get-EventLog -LogName Application -After (Get-Date).Date
Get-EventLog -LogName Application -Source Scecli

# create your own log
New-EventLog -LogName sWAT-PS -Source Deployment,PrinterMgmt,Backup 
Get-Eventlog -List
Limit-EventLog -LogName sWAT-PS -OverflowAction OverwriteAsNeeded -MaximumSize 10MB

# create log entries
Write-EventLog -LogName sWAT-PS `
               -Source Backup `
               -Message 'Fist event in this log.' `
               -EntryType Information `
               -EventId 4711 

# clear eventlog
Clear-EventLog -LogName sWAT-PS

# remove eventlog
Remove-EventLog -LogName sWAT-PS
