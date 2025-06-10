@echo off
setlocal
title Windows Network Repair Tool v1.0
mode con: cols=80 lines=30
color 0B

:: Simple admin check
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    color 0E
    echo.
    echo  ============================================================================
    echo                          ADMINISTRATOR ACCESS REQUIRED                       
    echo  ============================================================================
    echo.
    echo                                 NOTICE!
    echo.
    echo     This tool needs Administrator privileges to repair network settings.
    echo.
    echo     Please follow these steps:
    echo     1. Close this window
    echo     2. Right-click on the script
    echo     3. Select "Run as Administrator"
    echo.
    echo  ============================================================================
    echo.
    echo  Press any key to exit...
    pause >nul
    exit
)

:MENU
cls
color 0B
echo.
echo  ============================================================================
echo                        WINDOWS NETWORK REPAIR TOOL                           
echo  ============================================================================
echo.
echo                           _______________
echo                         /               \
echo                        /    _______      \
echo                       /   /         \     \
echo                      !   !    NO     !     !
echo                      !   ! CONNECTION !     !
echo                      !   !    ===     !     !
echo                      !   !   [X_X]    !     !
echo                      !   !___________!     !
echo                      !                     !
echo                       \                   /
echo                        \                 /
echo                         \_______________/
echo.
echo                        Made by TheDeadCapitan
echo.
echo  ============================================================================
echo   [1] Quick Fix - Reset Network Adapter
echo   [2] DNS Fix - Flush DNS and Reset
echo   [3] Complete Network Reset - Full Diagnostic
echo   [4] Network Status Report
echo   [5] Advanced Troubleshooting
echo   [6] Exit
echo  ============================================================================
echo.
set /p choice="  Select an option (1-6): "

if %choice%==1 goto QUICK_FIX
if %choice%==2 goto DNS_FIX
if %choice%==3 goto COMPLETE_RESET
if %choice%==4 goto STATUS_REPORT
if %choice%==5 goto ADVANCED_MENU
if %choice%==6 goto EXIT
goto MENU

:QUICK_FIX
cls
color 0E
echo.
echo  ============================================================================
echo                            QUICK NETWORK FIX                                 
echo  ============================================================================
echo.
echo                                  ___
echo                                 [o_o]
echo                                  -!-
echo                                  / \
echo                               FIXING...
echo.
echo  [*] Resetting Network Adapter...
echo.
echo  ===========================================================================
echo.
echo  Progress: [..................................................] 0%%
timeout /t 1 >nul

echo  Progress: [##########........................................] 20%%
echo.
echo  [*] Releasing IP configuration...
ipconfig /release
timeout /t 2 >nul

echo  Progress: [####################..............................] 40%%
echo.
echo  [*] Renewing IP configuration...
ipconfig /renew
timeout /t 2 >nul

echo  Progress: [##############################....................] 60%%
echo.
echo  [*] Flushing DNS cache...
ipconfig /flushdns
timeout /t 2 >nul

echo  Progress: [########################################..........] 80%%
echo.
echo  [*] Resetting Winsock catalog...
netsh winsock reset
timeout /t 2 >nul

cls
color 0A
echo.
echo  ============================================================================
echo                            QUICK NETWORK FIX                                 
echo  ============================================================================
echo.
echo                                  ___
echo                                 [^_^]
echo                                  -!-
echo                                  / \
echo                               SUCCESS!
echo.
echo  Progress: [##################################################] 100%%
echo.
echo  [+] Network adapter reset successfully!
echo  [+] Please restart your computer for changes to take effect.
echo.
pause
goto MENU

:DNS_FIX
cls
color 0D
echo.
echo  ============================================================================
echo                              DNS REPAIR TOOL                                 
echo  ============================================================================
echo.
echo                               DNS
echo                              [===]
echo                               !!!
echo                            REPAIRING
echo.
echo  PHASE 1: Clearing DNS Cache
echo  ===========================
echo.
echo  Progress: [..................................................] 0%%
timeout /t 1 >nul
echo  Progress: [###############...................................] 30%%
echo.
echo  [*] Flushing DNS resolver cache...
ipconfig /flushdns
echo.
echo  [+] DNS cache cleared successfully!
echo.
timeout /t 2 >nul

echo  PHASE 2: Resetting DNS Settings
echo  ===============================
echo.
echo  Progress: [#########################.........................] 50%%
echo.
echo  [*] Registering DNS names...
ipconfig /registerdns
echo.
echo  Progress: [#####################################.............] 75%%
echo.
echo  [*] Resetting DNS client service...
net stop dnscache
net start dnscache
echo.
color 0A
echo  Progress: [##################################################] 100%%
echo.
echo  [+] DNS repair completed successfully!
echo.
pause
goto MENU

:COMPLETE_RESET
cls
color 09
echo.
echo  ============================================================================
echo                         COMPLETE NETWORK RESET                               
echo  ============================================================================
echo.
echo  WARNING: This will reset ALL network settings including:
echo    - IP Configuration
echo    - DNS Settings
echo    - Firewall Rules
echo    - Network Adapters
echo    - VPN Configurations
echo.
set /p confirm="  Are you sure you want to continue? (Y/N): "
if /i not %confirm%==Y goto MENU

cls
echo.
echo  Step 1/6: Resetting IP Configuration
echo  ====================================
ipconfig /release
ipconfig /renew
ipconfig /flushdns

cls
echo.
echo  Step 2/6: Resetting Winsock Catalog
echo  ===================================
netsh winsock reset
netsh int ip reset

cls
echo.
echo  Step 3/6: Resetting Network Adapters
echo  ====================================
netsh interface reset all
netsh advfirewall reset

cls
echo.
echo  Step 4/6: Clearing ARP Cache
echo  ============================
netsh interface ip delete arpcache
arp -d *

cls
echo.
echo  Step 5/6: Resetting Network Services
echo  ====================================
net stop "DHCP Client"
net stop "DNS Client"
net stop "Network Connections"
net stop "Network List Service"
net stop "Network Location Awareness"

timeout /t 3 >nul

net start "DHCP Client"
net start "DNS Client"
net start "Network Connections"
net start "Network List Service"
net start "Network Location Awareness"

cls
echo.
echo  Step 6/6: Rebuilding Network Stack
echo  ==================================
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global rss=enabled

cls
color 0A
echo.
echo  ============================================================================
echo                        RESET COMPLETED SUCCESSFULLY!                         
echo  ============================================================================
echo.
echo                          Network restored!
echo                               ___
echo                              [^o^]
echo                            ___\!/___
echo                               / \
echo                              /   \
echo.
echo  All network operations completed successfully!
echo  IMPORTANT: You MUST restart your computer now!
echo.
pause
goto MENU

:STATUS_REPORT
cls
color 0F
echo.
echo  ============================================================================
echo                          NETWORK STATUS REPORT                               
echo  ============================================================================
echo.
echo  Generating comprehensive network report...
echo.
echo  [1] IP Configuration
echo  ====================
ipconfig /all
echo.
echo  Press any key for next section...
pause >nul

cls
echo.
echo  [2] Network Connections
echo  =======================
netstat -an
echo.
echo  Press any key for next section...
pause >nul

cls
echo.
echo  [3] DNS Information
echo  ===================
nslookup google.com
echo.
echo  [4] Routing Table
echo  =================
route print
echo.
echo  Press any key for next section...
pause >nul

cls
echo.
echo  [5] Network Adapters
echo  ====================
wmic nic get name,index,macaddress,speed,netconnectionstatus
echo.
echo  [6] WiFi Profiles (if applicable)
echo  =================================
netsh wlan show profiles
echo.
pause
goto MENU

:ADVANCED_MENU
cls
color 06
echo.
echo  ============================================================================
echo                         ADVANCED TROUBLESHOOTING                             
echo  ============================================================================
echo.
echo                            _.-^^---....,,--
echo                        _--                  --_
echo                       ^<          ADVANCED        ^>^)
echo                       ^|         TOOLS MENU        ^|
echo                        \._                   _./
echo                           ```--. . , ; .--'''
echo                                 ^| ^|   ^|
echo                              .-=^|^| ^| ^|=-.
echo                              `-=#$%&%$#=-'
echo                                 ^| ;  :^|
echo                        _____.,-#%&$@%#&#~,._____
echo.
echo  ============================================================================
echo   [1] Ping Test Suite
echo   [2] Trace Route Analysis
echo   [3] Port Scanner
echo   [4] WiFi Troubleshooter
echo   [5] Network Speed Test
echo   [6] Back to Main Menu
echo  ============================================================================
echo.
set /p advchoice="  Select an option (1-6): "

if %advchoice%==1 goto PING_TEST
if %advchoice%==2 goto TRACEROUTE
if %advchoice%==3 goto PORT_SCAN
if %advchoice%==4 goto WIFI_TROUBLE
if %advchoice%==5 goto SPEED_TEST
if %advchoice%==6 goto MENU
goto ADVANCED_MENU

:PING_TEST
cls
color 0E
echo.
echo  ============================================================================
echo                              PING TEST SUITE                                 
echo  ============================================================================
echo.
echo  Testing connectivity to multiple servers...
echo.
echo  [1] Testing Gateway...
for /f "tokens=2,3 delims= " %%a in ('echo.^|ipconfig^|findstr "Default Gateway"') do set gateway=%%b
ping -n 4 %gateway%
echo.
echo  [2] Testing DNS (Google)...
ping -n 4 8.8.8.8
echo.
echo  [3] Testing Internet (google.com)...
ping -n 4 google.com
echo.
echo  [4] Testing Cloudflare DNS...
ping -n 4 1.1.1.1
echo.
pause
goto ADVANCED_MENU

:TRACEROUTE
cls
color 0C
echo.
echo  ============================================================================
echo                            TRACE ROUTE ANALYSIS                              
echo  ============================================================================
echo.
set /p target="  Enter target hostname or IP (default: google.com): "
if "%target%"=="" set target=google.com
echo.
echo  Tracing route to %target%...
echo.
tracert %target%
echo.
pause
goto ADVANCED_MENU

:PORT_SCAN
cls
color 05
echo.
echo  ============================================================================
echo                              PORT SCANNER                                    
echo  ============================================================================
echo.
echo  Common ports status on localhost:
echo.
echo  Checking port 80 (HTTP)...
netstat -an | findstr :80
echo.
echo  Checking port 443 (HTTPS)...
netstat -an | findstr :443
echo.
echo  Checking port 3389 (RDP)...
netstat -an | findstr :3389
echo.
echo  Checking port 445 (SMB)...
netstat -an | findstr :445
echo.
echo  Checking port 135 (RPC)...
netstat -an | findstr :135
echo.
pause
goto ADVANCED_MENU

:WIFI_TROUBLE
cls
color 0D
echo.
echo  ============================================================================
echo                           WIFI TROUBLESHOOTER                                
echo  ============================================================================
echo.
echo  [*] Showing WiFi interfaces...
netsh wlan show interfaces
echo.
echo  [*] Available WiFi networks...
netsh wlan show networks
echo.
echo  [*] WiFi driver information...
netsh wlan show drivers
echo.
echo  [*] Resetting WiFi adapter...
netsh wlan disconnect
timeout /t 2 >nul
netsh wlan connect
echo.
pause
goto ADVANCED_MENU

:SPEED_TEST
cls
color 03
echo.
echo  ============================================================================
echo                           NETWORK SPEED TEST                                 
echo  ============================================================================
echo.
echo  Testing network performance...
echo.
echo  [*] Testing download speed (approximate)...
echo.
set startTime=%time%
powershell -Command "(New-Object Net.WebClient).DownloadString('http://www.google.com')" >nul
set endTime=%time%
echo  Download test completed.
echo.
echo  [*] Network adapter speeds:
wmic nic where NetEnabled=true get Name,Speed
echo.
echo  [*] Current bandwidth usage:
netstat -e
echo.
pause
goto ADVANCED_MENU

:EXIT
cls
color 0B
echo.
echo  ============================================================================
echo                         THANK YOU FOR USING                                  
echo                      WINDOWS NETWORK REPAIR TOOL                             
echo  ============================================================================
echo.
echo                            ___     ___
echo                           [o o]   [o o]
echo                            \-/     \-/
echo                         ___-!-_____-!-___
echo                            / \     / \
echo                           /   \   /   \
echo                          ~~~~~~~~~~~~~~
echo                         STAY CONNECTED!
echo.
echo                     Created by TheDeadCapitan
echo.
echo              "Even dead connections can be revived"
echo.
echo  Your network has been checked and repaired.
echo  Remember to restart if you made major changes!
echo.
echo  ============================================================================
echo.
echo  Closing in 5 seconds...
timeout /t 5 /nobreak >nul
exit
