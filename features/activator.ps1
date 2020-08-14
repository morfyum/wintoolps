# ENABLE TO RUN:
# 
# NOT ADMIN IN CMD: powershell -Command "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted -Force"
#
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force
# USERNAME: $env:USERNAME
# WAIT FOR PROCESS:
#	| Out-Null 
#	-Wait

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

echo "========================"
echo "Check Windows Version..."
echo "========================"
echo "Hello $env:USERNAME! "
# Start-Process powershell -Verb runAs
$version = Get-WindowsEdition -Online | Out-String
$version = $version -replace "`t|`n|`r",""

echo ""
echo $version
echo ""

echo "==========="
echo "SUPPORTED SYSTEMS"
echo "==========="
echo "Home: $vHome"
echo "Home N: $vHomeN"
echo "Home Single Language: $vHomeSingleLanguage"
echo "Home Country Specific: $vHomeCountrySpecific"
echo "Professional: $vProfessional"
echo "Professional N: $vProfessionalN"
echo "Education: $vEducation"
echo "Education N: $vEducationN"
echo "Enterprise: $vEnterprise"
echo "Enterprise N: $vEnterpriseN"
echo ""

echo "==========="
echo "ACTIVATE..."
echo "==========="

$usedkey = ""

function testUsedKey {
    if ( $usedkey = "" ) {
        echo "  Something Went Wrong!"
        exit
    } else {
        echo "Test used key..."
        echo "  OK"
    }
}

function addKeyToWin {
    echo "Add key..."

    Try {
        slmgr /ipk $usedkey | Out-Null
        echo "  OK"
    }
    Catch {
        echo "  Failed to add key... EXIT"
        exit
    }
}

function setServer {
    echo "Set server..."

    Try {
        slmgr /skms kms8.msguides.com | Out-Null
        echo "  OK"
    }
    Catch {
        echo "  Failed"
        #exit
    }
}

function activateMachine{
    echo "Activate Machine..."
    
    Try {
        slmgr /ato | Out-Null
        echo "  OK"
    }
    Catch {
        echo "  Failed"
        exit
    }
}


if ( $version -eq "Edition : Home" ){
    $usedkey = $vHome
    echo "Home: $vHome"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Home N" ){
    $usedkey = $vHomeN
    echo "Home N: $vHomeN"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Home Single Language" ){
    $usedkey = $vHomeSingleLanguage
    echo "Home Single Language: $vHomeSingleLanguage"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Home Country Specific" ){
    $usedkey = $vHomeCountrySpecific
    echo "Home Country Specific: $vHomeCountrySpecific"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Professional" ){
    $usedkey = $vProfessional
    echo "Professional: $vProfessional"
    #echo "usedkey:      $usedkey"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Professional N" ){
    $usedkey = $vProfessionalN
    echo "Professional N: $vProfessionalN"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Education" ){
    $usedkey = $vEducation
    echo "Education: $vEducation"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Education N" ){
    $usedkey = $vEducationN
    echo "Education N: $vEducationN"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Enterprise" ){
    $usedkey = $vEnterprise
    echo "Enterprise: $vEnterprise"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Enterprise N" ){
    $usedkey = $vEnterpriseN
    echo "Enterprise N: $vEnterpriseN"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
} else{
    echo "Can't Define your system type"
    echo "Please report it for developer"
}

#echo ""
#echo "Execution policy is set: Restricted"
#echo "This is the default setting"
#Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted -Force

pause