# Security-log-monitor
# Security Log Monitor

PowerShell tool that monitors Windows Security logs and detects suspicious activity in the last 24 hours.

## Features
- Failed logon detection (4625)
- User creation tracking (4720)
- Security log cleared alert (1102)
- Group membership changes
- GUI / MessageBox alerts

## Usage
Run with PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\SecurityMonitor.ps1
