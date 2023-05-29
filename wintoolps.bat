ECHO OFF
CLS
set policyStatus = FAIL
ECHO ####################################################################
ECHO # WARNING! Press 1. to Enable scipt execution,                     #
ECHO # after you finished, please press 2. to Disable script execution. #
ECHO # STATUS: Unrestricted is NOT recommended, this is unsecure!       #
ECHO ####################################################################
:MENU
for /f %%i in ('powershell -Command "Get-ExecutionPolicy"') do set policyStatus=%%i
ECHO.
ECHO ============= CMD MENU =============
ECHO STATUS:   %policyStatus%
ECHO.
ECHO 0 - EXIT                       / 5 - Restore Health
ECHO 1 - Enable Execute Scripts     / 6 - Restart Network
ECHO 2 - Disable to Execute Scripts / 7
ECHO 3 - Activate Windows 10        / 8
ECHO 4 - Activate Windows 11        / 9
ECHO ========== UNSTABLE TOOLS ==========
ECHO 10 - service-manager
ECHO.

SET /P M=USE: 

IF %M%==0 GOTO EXIT
IF %M%==1 GOTO EXPOLENABLE
IF %M%==2 GOTO EXPOLDISABLE
IF %M%==3 GOTO W10ACTIVATOR
IF %M%==4 GOTO W11ACTIVATOR
IF %M%==5 GOTO RESTOREHEALTH
IF %M%==6 GOTO RESTART-NETWORK
IF %M%==10 GOTO SERVICE-MANAGER

:EXPOLENABLE
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force"
test&cls
GOTO MENU

:EXPOLDISABLE
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted -Force"
test&cls
GOTO MENU

:W10ACTIVATOR
powershell -Command "Start-Process powershell.exe -ArgumentList '%cd%\features\w10-activator.ps1' " -Verb RunAs
test&cls
GOTO MENU

:W11ACTIVATOR
powershell -Command "Start-Process powershell.exe -ArgumentList '%cd%\features\w11-activator.ps1' " -Verb RunAs
test&cls
GOTO MENU

:RESTOREHEALTH
powershell -Command "Start-Process powershell.exe -ArgumentList '%cd%\features\restoreHealth.ps1' " -Verb RunAs
test&cls
GOTO MENU

:RESTART-NETWORK
powershell -Command "Start-Process powershell.exe -ArgumentList '%cd%\features\network-restart.ps1' "
test&cls
GOTO MENU

:SERVICE-MANAGER
powershell -Command "Start-Process powershell.exe -ArgumentList 'cd %cd%\features; .\service-manager.ps1' " -Verb RunAs
test&cls
GOTO MENU

:NOTE
cd %windir%\system32\notepad.exe
start notepad.exe
test&cls
GOTO MENU

:CALC
cd %windir%\system32\calc.exe
start calc.exe
test&cls
GOTO MENU

:BOTH
cd %windir%\system32\notepad.exe
start notepad.exe
cd %windir%\system32\calc.exe
start calc.exe
test&cls
GOTO MENU

:EXIT
ECHO Exit 0 - Bye!