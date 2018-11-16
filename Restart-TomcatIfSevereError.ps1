# Get last Catalina log
$LastLog = Get-ChildItem catalina.*.log | Sort-Object LastWriteTime | Select-Object -last 1

# If log contains SEVERE error restart Tomcat service
if(Get-Content $LastLog -First 2 -Wait | Select-String -pattern "SEVERE" -Quiet){
    #stop and start services here
    Restart-Service -Name Tomcat7
 }