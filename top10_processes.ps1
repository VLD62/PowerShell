####################################################################################### 
# Script to log top 10 CPU Utilization processes 
####################################################################################### 
$timestamp = "Timestamp: $(Get-Date)"

$resultset=Get-WmiObject Win32_PerfFormattedData_PerfProc_Process | where-object{ $_.Name -ne "_Total" -and $_.Name -ne "Idle"} | Sort-Object PercentProcessorTime -Descending | select -First 10 | Format-Table Name,IDProcess,PercentProcessorTime  -AutoSize 


$resultset | out-file -Append -Encoding ASCII  d:\dev\ps\CpuUtilizaton.log 
   
Add-Content d:\dev\ps\CpuUtilizaton.log $timestamp 
