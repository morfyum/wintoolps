# ENABLE TO RUN:
# 
# NOT ADMIN IN CMD: powershell -Command "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted -Force"
#
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force
# USERNAME: $env:USERNAME
# WAIT FOR PROCESS:
#	| Out-Null 
#	-Wait


#W8_Core = "BN3D2-R7TKB-3YPBD-8DRP2-27GG4"
#W8_Core_Single_Language: "2WN2H-YGCQR-KFX6K-CD6TF-84YXQ"
#W8_Professional: "NG4HW-VH26C-733KW-K6F98-J8CK4"
#W8_Professional_N: "XCVCF-2NXM9-723PB-MHCB7-2RYQQ"
#W8_Professional_WMC: "GNBB8-YVD74-QJHX6-27H4K-8QHDG"
#W8_Enterprise: "32JNW-9KQ84-P47T8-D8GGY-CWCK7"
#W8_Enterprise_N: "JMNMF-RHW7P-DMY6X-RF3DR-X2BQT"

# Windows 8.1 Services to disable:
# Spooler	-> Nyomtató várólista
# Wsearch	-> Windows Search tartalomindexelés
# AeLookupSvc	-> Appllication Experience (Alkamazásminősítő)
# WMPNetworkSvc	-> Windows MEdia player (manuális, nem indu, nem kell kikapcsolni)
# fax			-> Fax service
# WerSvc		-> Windows hibajelentő - Néha random elindul és zabálja a CPU-t.
# edgeupdate	-> Microsoft Edge Update service
# MicrosoftEdgeElevationService

$W8d1_Core = "M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK"
$W8d1_Core_N = "7B9N3-D94CG-YTVHR-QBPX3-RJP64"
$W8d1_Core_Single_Language = "BB6NG-PQ82V-VRDPW-8XVD2-V8P66"
$W8d1_Professional = "GCRJD-8NW9H-F2CDX-CCM8D-9D6T9"
$W8d1_Professional_N = "HMCNV-VVBFX-7HMBH-CTY9B-B4FXY"
$W8d1_Professional_WMC = "789NJ-TQK6T-6XTH8-J39CJ-J8D3P"
$W8d1_Enterprise = "MHF9N-XY6XB-WVXMC-BTDCT-MKKG7"
$W8d1_Enterprise_N = "TT4HM-HN7YT-62K67-RGRQJ-JFFXW"

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
        echo "  usedKey is not defined! "
        exit
    } else {
        echo "[ OK ] Test used key..."
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

# Win 8.1: if Build lesser than 9600 !!!
# WINDOWS 8.1 version tests
if ( $version -eq "Edition : Core" ){
    $usedkey = $W8d1_Core
    echo "Windows 8.1 Core: $W8d1_Core"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Core N" ){
    $usedkey = $W8d1_Core_N
    echo "Windows 8.1 Core N: $W8d1_Core_N"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Core Single Language" ){
    $usedkey = $W8d1_Core_Single_Language
    echo "Windows 8.1 Core Single Language: $W8d1_Core_Single_Language"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Professional" ){
    $usedkey = $W8d1_Professional
    echo "Windows 8.1 Professional: $W8d1_Professional"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Professional N" ){
    $usedkey = $W8d1_Professional_N
    echo "Windows 8.1 Professional N: $W8d1_Professional_N"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Professional WMC" ){
    $usedkey = $W8d1_Professional_WMC
    echo "Windows 8.1 Professional WMC: $W8d1_Professional_WMC"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Enterprise" ){
    $usedkey = $W8d1_Enterprise
    echo "Windows 8.1 Enterprise: $W8d1_Enterprise"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
elseif ( $version -eq "Edition : Enterprise N" ){
    $usedkey = $W8d1_Enterprise_N
    echo "Windows 8.1 Enterprise N: $W8d1_Enterprise_N"
    testUsedkey
    addKeyToWin
    setServer
    activateMachine
}
else {
    echo "Can't Define your system type"
    echo "Please report it for developer"
}

#echo ""
#echo "Execution policy is set: Restricted"
#echo "This is the default setting"
#Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted -Force

pause