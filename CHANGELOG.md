# Changelog

All notable changes to Windows Repair Tools will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Automatic backup before repairs
- Export results to file
- Windows Update repair tool
- Driver repair tool
- Registry backup/repair tool
- GUI version using PowerShell

## [1.0.0] - 2024-XX-XX

### Added
- Initial release of Windows Repair Tools
- Network Repair Tool with 5 main functions:
  - Quick Fix for network adapter reset
  - DNS Fix for DNS-related issues
  - Complete Network Reset for full stack repair
  - Network Status Report for diagnostics
  - Advanced Troubleshooting tools
- System File Repair Tool with 4 main functions:
  - Quick Scan using SFC only
  - Deep Scan using SFC + DISM
  - Complete System Repair with full diagnostics
  - CBS Log Viewer
- ASCII art enhanced interface
- Administrator privilege detection
- Progress indicators for all operations
- Comprehensive error handling
- Safety confirmations for critical operations

### Security
- All operations use built-in Windows commands only
- No external downloads or dependencies
- No data collection or internet requirement (except DISM)

[1.0.0]: https://github.com/TheDeadCapitan/windows-repair-tools/releases/tag/v1.0.0
