$i = 1
Write-Host "OracleService is starting... Please wait ~ 60s"
while ($i -lt 20) {
	if ((get-service -Name OracleServiceORA193).Status -ne "Running"){
		sleep 10
		$i++ 
	}
	elseif ((get-service -Name OracleServiceORA193).Status -eq "Running"){
		Write-Host "OracleService is Running" -ForegroundColor green
		break
	}
	else {
		$status = ((get-service -Name OracleServiceORA193).Status)
		Write-Host "OracleService has $status status" -ForegroundColor red
		exit 1
	}
}
if ($i -eq 20){
	Write-Host "OracleService NOT Running!" -ForegroundColor red
	exit 1
}

$chekdbsql = "`nselect status from v`$instance;"
$chkdb = ""
$i = 1
while ($i -lt 10) {
    $chkdb = ($chekdbsql | cmd /c "sqlplus sys/password@localhost/ora193 as sysdba")
    if ($chkdb.Contains("OPEN") -eq 'True'){
        Write-Host "Database's status is 'OPEN'." -ForegroundColor green
		break 
		}
		echo "Trying to connect to database. Attempt $i"
		sleep 10
		$i++ 
	}
if ($i -eq 10){
	Write-Host "Can't connect to Oracle Database!" -ForegroundColor red
	exit 1
}