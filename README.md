# 🛡️ Security Log Monitor

A lightweight PowerShell-based Security Information & Event Monitoring (SIEM-like) tool for Windows.

It analyzes the Windows Security Event Log and detects potentially suspicious activity within the last 24 hours.

---

## 📌 Features

- 🔍 Monitors Windows Security Event Log
- ⏱ Analyzes last 24 hours of activity
- 🚨 Detects security-relevant Event IDs:
  - `4625` — Failed logon attempts
  - `4720` — New user created
  - `4726` — User deleted
  - `4728` — Added to global group
  - `4732` — Added to local group
  - `1102` — Security log cleared (critical)

- 🧠 Human-readable event descriptions
- 📊 Sorted event timeline output
- 🪟 Popup alert notifications (MessageBox)
- 📁 Export-ready structure (can be extended to CSV/HTML)

---

## ⚙️ How It Works

The script uses:

- `Get-WinEvent` for querying Windows Security logs
- Event ID filtering for relevant security signals
- A lookup table to translate Event IDs into readable descriptions
- Simple alert logic to notify the user when suspicious activity is found

---

## 🚀 Usage

### Run directly in PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\SecurityMonitor.ps1
