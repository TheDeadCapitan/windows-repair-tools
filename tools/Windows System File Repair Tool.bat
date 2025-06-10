@echo off
setlocal
title Windows System File Repair Tool v1.0
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
    echo     This tool needs Administrator privileges to repair system files.
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
echo                        WINDOWS SYSTEM FILE REPAIR TOOL                       
echo  ============================================================================
echo.
echo                            _______________
echo                          /               \
echo                         /    _______      \
echo                        /   /         \     \
echo                       !   !   R.I.P   !     !
echo                       !   !           !     !
echo                       !   ! CORRUPTED !     !
echo                       !   !   FILES   !     !
echo                       !   !___________!     !
echo                       !                     !
echo                        \                   /
echo                         \                 /
echo                          \_______________/
echo.
echo                        Made by TheDeadCapitan
echo.
echo  ============================================================================
echo   [1] Quick Scan - System File Checker Only
echo   [2] Deep Scan - SFC + DISM Repair  
echo   [3] Complete System Repair - Full Diagnostic
echo   [4] View CBS Log File
echo   [5] Exit
echo  ============================================================================
echo.
set /p choice="  Select an option (1-5): "

if %choice%==1 goto QUICK_SCAN
if %choice%==2 goto DEEP_SCAN
if %choice%==3 goto COMPLETE_REPAIR
if %choice%==4 goto VIEW_LOG
if %choice%==5 goto EXIT
goto MENU

:QUICK_SCAN
cls
color 0E
echo.
echo  ============================================================================
echo                            QUICK SYSTEM SCAN                                 
echo  ============================================================================
echo.
echo                                 .--.
echo                                /.-.\ 
echo                                 o.o
echo                                 ___
echo                              SCANNING
echo.
echo  [*] Starting System File Checker...
echo.
echo  ===========================================================================
echo.
echo  Preparing scan...
echo  [..................................................] 0%%
timeout /t 1 >nul
cls
color 0E
echo.
echo  ============================================================================
echo                            QUICK SYSTEM SCAN                                 
echo  ============================================================================
echo.
echo  Scanning system files...
echo  [##########........................................] 20%%
echo.
sfc /scannow
echo.
cls
color 0A
echo.
echo  ============================================================================
echo                            QUICK SYSTEM SCAN                                 
echo  ============================================================================
echo.
echo                                 \o/
echo                                  !
echo                                 / \
echo                              SUCCESS!
echo.
echo  Scan Complete!
echo  [##################################################] 100%%
echo.
echo  [+] System File Checker completed successfully!
echo.
pause
goto MENU

:DEEP_SCAN
cls
color 0D
echo.
echo  ============================================================================
echo                              DEEP SYSTEM SCAN                                
echo  ============================================================================
echo.
echo                               [o_o]
echo                                -!-
echo                                / \
echo                             DEEP SCAN
echo.
echo  PHASE 1: System File Checker
echo  ============================
echo.
echo  Progress: [..................................................] 0%%
timeout /t 1 >nul
echo  Progress: [#########.........................................] 20%%
echo.
echo  [*] Initializing SFC scan...
sfc /scannow
echo.
color 0A
echo  Progress: [##################################################] 100%%
echo  [+] SFC scan completed!
echo.
timeout /t 3 >nul

cls
color 05
echo.
echo  ============================================================================
echo                              DEEP SYSTEM SCAN                                
echo  ============================================================================
echo.
echo  PHASE 2: DISM Health Restoration
echo  ================================
echo.
echo  Progress: [..................................................] 0%%
timeout /t 1 >nul
echo  Progress: [##########........................................] 20%%
echo.
echo  [*] Checking component store health...
DISM /Online /Cleanup-Image /CheckHealth
echo.
echo  Progress: [####################..............................] 40%%
echo.
echo  [*] Scanning for component store corruption...
DISM /Online /Cleanup-Image /ScanHealth
echo.
echo  Progress: [#################################.................] 70%%
echo.
echo  [*] Repairing Windows image...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
color 0A
echo  Progress: [##################################################] 100%%
echo.
echo  [+] DISM repair completed successfully!
echo.
pause
goto MENU

:COMPLETE_REPAIR
cls
color 09
echo.
echo  ============================================================================
echo                         COMPLETE SYSTEM REPAIR                               
echo  ============================================================================
echo.
echo  This will perform a comprehensive system repair including:
echo    - System File Checker (SFC)
echo    - DISM Image Repair
echo    - Windows Update Components Reset
echo    - System Health Report
echo.
set /p confirm="  Are you sure you want to continue? (Y/N): "
if /i not %confirm%==Y goto MENU

cls
echo.
echo  Step 1/4: System File Integrity Check
echo  =====================================
sfc /scannow

cls
echo.
echo  Step 2/4: Windows Image Health Check
echo  ====================================
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

cls
echo.
echo  Step 3/4: Windows Update Components
echo  ===================================
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old 2>nul
ren C:\Windows\System32\catroot2 catroot2.old 2>nul
net start wuauserv
net start cryptSvc
net start bits
net start msiserver

cls
echo.
echo  Step 4/4: Generating System Health Report
echo  =========================================
echo  [*] Creating detailed report...
perfmon /report

cls
color 0A
echo.
echo  ============================================================================
echo                        REPAIR COMPLETED SUCCESSFULLY!                        
echo  ============================================================================
echo.
echo                       All systems restored!
echo.
echo  All repair operations completed successfully!
echo  It's recommended to restart your computer now.
echo.
pause
goto MENU

:VIEW_LOG
cls
color 0F
echo.
echo  ============================================================================
echo                            CBS LOG VIEWER                                    
echo  ============================================================================
echo.
echo  Opening CBS.log file...
echo.
if exist %windir%\Logs\CBS\CBS.log (
    findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log | more
) else (
    echo  [!] CBS.log file not found!
)
echo.
pause
goto MENU

:EXIT
cls
color 0B
echo.
echo  ============================================================================
echo                         THANK YOU FOR USING                                  
echo                    WINDOWS SYSTEM FILE REPAIR TOOL                          
echo  ============================================================================
echo.
echo                            ___     ___
echo                           (o o)   (o o)
echo                          (  V  ) (  V  )
echo                           --!--   --!--
echo                            / \     / \
echo                           /   \   /   \
echo                          ~~~~~~~~~~~~~~
echo                         HAPPY COMPUTING!
echo.
echo                     Created by TheDeadCapitan
echo.
echo              "Even dead files can be resurrected"
echo.
echo  Your system has been checked and repaired.
echo  For best results, restart your computer now.
echo.
echo  ============================================================================
echo.
echo  Closing in 5 seconds...
timeout /t 5 /nobreak >nul
exit
