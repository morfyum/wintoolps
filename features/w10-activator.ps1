# ENABLE TO RUN:
# 
# NOT ADMIN IN CMD: powershell -Command "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted -Force"
#
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force
# USERNAME: $env:USERNAME
# WAIT FOR PROCESS:
#	| Out-Null 
#	-Wait

$usedKey = ""
$serverName = "kms8.msguides.com" # or kms.msguides.com

$vHome = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
$vHomeN = "3KHY7-WNT83-DGQKR-F7HPR-844BM"
$vHomeSingleLanguage = "7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
$vHomeCountrySpecific = "PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
$vProfessional = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
$vProfessionalN = "MH37W-N47XK-V7XM9-C7227-GCQG9"
$vEducation = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
$vEducationN = "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
$vEnterprise = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
$vEnterpriseN = "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"

Write-Host "*** Check Windows Edition ***" -ForegroundColor Green
Write-Host "Hello $env:USERNAME! "
$version = (Get-WindowsEdition -Online).Edition
Write-Host "This Edition: $version"

Write-Host "*** Available Editions ***" -ForegroundColor Green
echo "Home:                  $vHome"
echo "Home N:                $vHomeN"
echo "Home Single Language:  $vHomeSingleLanguage"
echo "Home Country Specific: $vHomeCountrySpecific"
echo "Professional:          $vProfessional"
echo "Professional N:        $vProfessionalN"
echo "Education:             $vEducation"
echo "Education N:           $vEducationN"
echo "Enterprise:            $vEnterprise"
echo "Enterprise N:          $vEnterpriseN"


function testUsedKey {
	Write-Host " - Test winKey..."
    if ( $usedKey -eq "" ) {
        Write-Host " : Unsupported Edition, Exit." -ForegroundColor Red
        exit 1
    }
    Write-Host " : $usedKey"
}


function addKeyToWin {
    Write-Host " - Add winKey..."
    Try {
        slmgr /ipk $usedkey | Out-Null
        Write-Host "Done"
    }
    Catch {
        Write-Host "Failed to add key, Exit" -ForegroundColor Red
        exit 2
    }
}


function setServer {
    Write-Host "Setting up server..."
    Try {
        slmgr /skms $serverName | Out-Null
        Write-Host "Done"
    }
    Catch {
        Write-Host "Server setup failed" -ForegroundColor Red
        exit 3
    }
}


function activateMachine{
    Write-Host "Activate Machine..."
    Try {
        slmgr /ato | Out-Null
        Write-Host "Done"
    }
    Catch {
        Write-Host "Failed to activate" -ForegroundColor Red
        exit 4
    }
}


Write-Host "*** Test Edition Compatibility ***" -ForegroundColor Green
switch ($version) {
    "Home"                  { "Supported"; $usedKey = $vHome }
    "Home N"                { "Supported"; $usedKey = $vHomeN }
    "Home Single Language"  { "Supported"; $usedKey = $vHomeSingleLanguage }
    "Home Country Specific" { "Supported"; $usedKey = $vHomeCountrySpecific }
    "Professional"          { "Supported"; $usedKey = $vProfessional }
    "Professional N"        { "Supported"; $usedKey = $vProfessionalN }    
    "Education"             { "Supported"; $usedKey = $vEducation }
    "Education N"           { "Supported"; $usedKey = $vEducationN }
    "Enterprise"            { "Supported"; $usedKey = $vEnterprise }
    "Enterprise N"          { "Supported"; $usedKey = $vEnterpriseN }
    default {
        Write-Host "Unknown edition: $version, Exit." -ForegroundColor Red
        Write-Host "Please Open an issue on GitHub!" -ForegroundColor Red
        exit 5 
    }
}


Write-Host "*** Activate ***" -ForegroundColor Green
testUsedKey
addKeyToWin
setServer
activateMachine
# Finish and pause
pause