#Setting variables for name of files
$filename1 = Get-ChildItem -Path D:\Temp\ -Filter "Specific_filename1_$(Get-Date (Get-Date).AddDays(-1) -f yyyyMMdd).txt" -Recurse | % { $_.FullName }
$filename2 = Get-ChildItem -Path D:\Temp\ -Filter "Specific_filename2_$(Get-Date (Get-Date).AddDays(-1) -f yyyyMMdd).txt" -Recurse | % { $_.FullName }

Send-MailMessage -From "Server <hostname@domain.com>" -To "User Name <user.name@domain.com>" , "User Name2 <user.name2@domain.com>" -Subject "Automated report $(Get-Date (Get-Date).AddDays(-1) -f yyyyMMdd)" -Body "Body of the mail" -Attachments "$filename1" , "$filename2" -Priority High -DNO onSuccess, onFalure -SmtpServer "smtp.host.domain.com"