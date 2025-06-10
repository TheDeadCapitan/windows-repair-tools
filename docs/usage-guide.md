# Detailed Usage Guide

## Table of Contents
- [Getting Started](#getting-started)
- [Network Repair Tool Guide](#network-repair-tool-guide)
- [System File Repair Tool Guide](#system-file-repair-tool-guide)
- [Troubleshooting Common Issues](#troubleshooting-common-issues)
- [Best Practices](#best-practices)

## Getting Started

### Prerequisites
1. Windows 7 or higher
2. Administrator privileges
3. Basic understanding of command prompt

### Running the Tools

#### Step 1: Download
- Download the `.bat` file from the repository
- Save it to an easily accessible location (e.g., Desktop)

#### Step 2: Run as Administrator
- **Right-click** on the `.bat` file
- Select **"Run as Administrator"**
- Click **"Yes"** on the UAC prompt

#### Step 3: Navigate the Menu
- Use number keys (1-6) to select options
- Press Enter to confirm your selection
- Follow on-screen instructions

## Network Repair Tool Guide

### Menu Options Explained

#### 1. Quick Fix - Reset Network Adapter
**When to use**: 
- Internet suddenly stops working
- "No Internet Access" message
- Can't obtain IP address

**What it does**:
- Releases current IP configuration
- Renews IP address from DHCP
- Flushes DNS cache
- Resets Winsock catalog

#### 2. DNS Fix - Flush DNS and Reset
**When to use**:
- Websites won't load but internet is connected
- "Server not found" errors
- DNS resolution issues

**What it does**:
- Clears DNS resolver cache
- Re-registers DNS entries
- Restarts DNS client service

#### 3. Complete Network Reset - Full Diagnostic
**When to use**:
- Multiple network issues
- After malware removal
- VPN connection problems
- As a last resort

**What it does**:
- Complete IP stack reset
- Firewall rules reset
- All network adapters reset
- Network services restart

⚠️ **Warning**: This will remove all network configurations including WiFi passwords!

#### 4. Network Status Report
**When to use**:
- Diagnosing network issues
- Checking current configuration
- Documenting network setup

**What it provides**:
- IP configuration details
- Active connections list
- DNS server information
- Routing table
- Network adapter status
- WiFi profiles

#### 5. Advanced Troubleshooting

##### Ping Test Suite
- Tests connectivity to gateway, DNS servers, and internet
- Helps identify where connection fails

##### Trace Route Analysis
- Shows the path packets take to destination
- Identifies network bottlenecks

##### Port Scanner
- Checks common port status
- Useful for firewall troubleshooting

##### WiFi Troubleshooter
- Shows WiFi interface details
- Lists available networks
- Resets WiFi adapter

##### Network Speed Test
- Basic bandwidth assessment
- Shows adapter speeds

## System File Repair Tool Guide

### Menu Options Explained

#### 1. Quick Scan - System File Checker Only
**When to use**:
- System errors or crashes
- Missing system files
- After virus removal

**What it does**:
- Runs `sfc /scannow`
- Scans all protected system files
- Repairs corrupted files

**Time required**: 15-30 minutes

#### 2. Deep Scan - SFC + DISM Repair
**When to use**:
- SFC fails to repair files
- Windows Update errors
- Component store corruption

**What it does**:
- Runs System File Checker
- Checks component store health
- Repairs Windows image
- Restores system health

**Time required**: 30-60 minutes

#### 3. Complete System Repair - Full Diagnostic
**When to use**:
- Multiple system issues
- Major corruption suspected
- Before Windows reinstall attempt

**What it does**:
- Full SFC scan
- Complete DISM repair
- Windows Update reset
- System health report generation

**Time required**: 60-90 minutes

#### 4. View CBS Log File
**When to use**:
- After running SFC
- To see detailed repair information
- Troubleshooting specific files

**What it shows**:
- Corrupted files found
- Repair actions taken
- Any failures encountered

## Troubleshooting Common Issues

### "Access Denied" Error
**Solution**: Ensure you're running as Administrator

### Tool Closes Immediately
**Causes & Solutions**:
1. Not running as admin - Right-click and "Run as Administrator"
2. Antivirus blocking - Add exception for the .bat file
3. Corrupted download - Re-download the file

### Repairs Don't Work
**Try these steps**:
1. Run in Safe Mode
2. Disable antivirus temporarily
3. Run Windows Update
4. Consider Windows Reset/Reinstall

### Network Still Not Working After Repair
1. Check physical connections
2. Update network drivers
3. Check router/modem
4. Contact ISP

## Best Practices

### Before Running Tools
1. **Create System Restore Point**
   - Type "restore point" in Start Menu
   - Click "Create a restore point"
   - Click "Create" and name it

2. **Backup Important Data**
   - Documents, photos, etc.
   - Note down WiFi passwords

3. **Close All Programs**
   - Save all work
   - Close browsers and applications

### After Running Tools
1. **Restart Computer**
   - Essential for changes to take effect
   - Don't skip this step!

2. **Test Functionality**
   - Check if issues are resolved
   - Run Windows Update

3. **Document Changes**
   - Note what was done
   - Save any log files

### Regular Maintenance
- Run Quick Scan monthly
- Keep Windows updated
- Regular malware scans
- Driver updates

## Advanced Tips

### Creating Shortcuts
1. Right-click on .bat file
2. Select "Create shortcut"
3. Right-click shortcut
4. Properties > Advanced
5. Check "Run as administrator"

### Scheduling Automatic Runs
Use Task Scheduler to run maintenance:
1. Open Task Scheduler
2. Create Basic Task
3. Set trigger (weekly/monthly)
4. Action: Start program
5. Browse to .bat file
6. Check "Run with highest privileges"

### Command Line Parameters
Future versions may support:
```batch
network-repair-tool.bat /quickfix
system-repair-tool.bat /deepscan
```

## Need More Help?

- Check the [Troubleshooting Guide](troubleshooting.md)
- Open an [Issue](https://github.com/yourusername/windows-repair-tools/issues)
- Read Windows Event Viewer logs
- Consult Microsoft Support
