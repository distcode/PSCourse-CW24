
# objects - properties
$myFile = Get-ChildItem -Path C:\Windows\win.ini
$myFile
$myFile | Get-Member
$myFile.name
$myFile.BaseName

# objects - methods
$myProcess = Get-Process -Name powershell_ise
$myProcess | Get-Member
$myProcess.Kill()

md Temp
$myFile.CopyTo('C:\Temp\wincopy.ini')
ls .\Temp\
$myFile

# sort-object
Get-Process
Get-Process | Sort-Object -Property workingset
Get-Process | Get-Member
Get-Process | Sort-Object -Property workingset -Descending
Get-Process 
get-help Sort-Object -ShowWindow
$htProcessname = @{ Expression='Processname'; Descending = $false }
$htWorkingset = @{ Expression='Workingset'; Descending = $true }
Get-Process | Sort-Object -Property $htProcessname,$htWorkingset

# where-object
Get-Command -noun object
Get-Process
Get-Process | Where-Object { Workingset > 100000000  }
Get-Process | Where-Object { $_.Workingset -gt 100000000  }
Get-Process | Where-Object { $_.Workingset -gt 100MB  }
Get-Process | Where-Object { $_.Workingset -gt 100MB  } | Get-Member
Get-Process | Where-Object { $_.Workingset -gt 100MB  } 
Get-Process | Where-Object { $_.Workingset -gt 100MB -and $_.Id -gt 5000  } 
Get-Process | Where-Object { $_.Workingset -gt 100MB -or $_.Id -gt 5000  } 
Get-Process | Where-Object { $_.Workingset -gt 100MB  } | Get-Member

# select-object
Get-Process | Select-Object -Property Processname,Id,WorkingSet,Peakworkingset
Get-Process | Select-Object -Property Processname,Id,WorkingSet,Peakworkingset | Get-Member
Get-Process | Select-Object -First 5
Get-Process | Select-Object -last 3
Get-Process | Select-Object -Property processname
Get-Process | Select-Object -Property processname -Unique

# select-object with calculated columns
Get-ChildItem C:\Windows\ -File
$htSizeKB = @{ Expression= { $_.Length / 1KB } ; Label='Size(KB)' }
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,length,$htSizeKB
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,length,$htSizeKB | Measure-Object -Property length -Sum -Average -Minimum -Maximum
(Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,length,$htSizeKB | Measure-Object -Property length -Sum -Average -Minimum -Maximum).Sum
(Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,length,$htSizeKB | Measure-Object -Property length -Sum -Average -Minimum -Maximum).Sum / 1MB
(Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,length,$htSizeKB | Measure-Object -Property length -Sum -Average -Minimum -Maximum) | Get-Member

# group-object
Get-ChildItem C:\Windows\ -File | Group-Object -Property Extension

