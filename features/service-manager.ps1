# SCRIPT CONFIG 
$scriptLocation = [string](Get-Location)
$scriptName = "service-manager"

$workDir = "..\work\$($scriptName)"
$logDir = "..\log"

# Specific variables
$setServiceDisabled = "Disabled"
$setServiceAuto = "Auto"
$setServiceManual = "Manual"

echo "WORKPATH: $workDir"
echo "LOG:      $logDir"
echo "LOCATION: $scriptLocation"


#if ( !(Test-Path "$($workDir\)") )

<#
Try {
    Get-Service | select -Property name | ft -HideTableHeaders > $workDir
}
Catch {
    echo "Creating file..."
    New-Item -path C:Share -name sample.txt -type "file" -value "my new text"
}
#>


Get-Service | select -Property name | ft -HideTableHeaders > $workDir\serviceNameTemp.list
Get-Content $workDir\serviceNameTemp.list | Where-Object { $_.Trim() -ne '' } > $workDir\serviceNames.list
Remove-Item $workDir\serviceNameTemp.list




$i=0
$countService01 = Get-Content ..\work\service-manager\serviceNames.list | Measure-Object -Line | ft -HideTableHeaders | Out-String
$countService02 = $countService01 -replace "`t|`n|`r",""

while ( $i -lt $countService02 ) {
    echo "========================================================"
    echo "INDEX: $i/$countService02"

    $serviceName = Get-Content "$workDir\serviceNames.list" | Select -Index $i

    echo "SERVICE NAME: $serviceName" #Get-Content "$workDir\serviceNames.list" | Select -Index $i
    echo "SERVICE TYPE: "
    echo "DEFAULT STARTTYPE: "
    echo "========================================================"
    Get-Service $serviceName

    $i++
}

#clear
<#
while ($i -lt $serviceName.Length) {
    
    #clear
    echo "========================================================"
    Write-Host "PART: $($i+1)/$($serviceName.Length)"
    Write-Host "SERVICE TYPE: $($serviceType[$i])" -ForegroundColor Yellow
    Write-Host "PROPOSAL: $($serviceProposal[$i])" -ForegroundColor Yellow
    Write-Host "Disable >> $($serviceNick[$i]) << Service?" -ForegroundColor Cyan
    Write-Host "$($serviceUse[$i])" -ForegroundColor Red
    echo "========================================================"

    Get-Service $serviceName[$i]
    #Get-Service $serviceName[$i] | select -property Status,Name,Starttype,DisplayName

    echo "`nDESCRIPTION:`n----------`n$($serviceDesc[$i])"
    echo ""
    $confirmation = Read-Host "Disable: y | Skip: n | Y/n"

    if ($confirmation -eq 'y') {
        #Stop-Service $serviceName[$i]
        Write-Host "Service Stopped" -ForegroundColor Green
       
        echo "SET STARTUP TYPE: Disabled" >> $logPath\$logFileName
        Get-Service $serviceName[$i] | select -property Status,Name,Starttype,DisplayName >> $logPath\$logFileName

        #Set-Service $serviceName[$i] -StartupType $setStartupTyepe
        Write-Host "Service Disabled" -ForegroundColor Green
    } else {
        Write-Host "Skip`n" -ForegroundColor Red
    }

    $i++
}
#>