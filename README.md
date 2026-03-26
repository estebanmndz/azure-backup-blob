# 💾 Azure Blob Backup Automation (AzCopy + PowerShell)

![Azure](https://img.shields.io/badge/Azure-Storage-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue)
![AzCopy](https://img.shields.io/badge/AzCopy-Data%20Transfer-green)

> 💡 Automate local-to-cloud backups by uploading data to Azure Blob Storage using AzCopy

---

## 🧠 Overview

This project automates the backup of local data to Azure Blob Storage using **AzCopy**, a high-performance data transfer tool.

It is designed to simulate real-world scenarios such as:

* On-premise to cloud backups
* Data migration to Azure
* Automated data uploads for cloud workloads

---

## 🚨 Problem Statement

Organizations often need to move or back up local data to the cloud.

Without automation:

* Backups are manual and error-prone
* Data transfer is inconsistent
* There is no logging or traceability

---

## 🎯 Why This Matters

Reliable data transfer to cloud storage is critical for:

* Backup strategies
* Data migration projects
* Hybrid cloud environments

Automating this process improves consistency, reliability, and operational efficiency.

---

## 🏗️ Solution

This project provides a PowerShell script that:

* Takes a local folder as source
* Uploads data to Azure Blob Storage using **AzCopy**
* Supports a safe execution mode (**DryRun**)
* Logs all operations for auditing

---

## 🔄 Execution Flow

```
[Local Folder]
        ↓
[Script Execution]
        ↓
[AzCopy Command]
        ↓
[Upload to Blob Container]
        ↓
[Logs Generated]
```

---

## ⚙️ Technical Highlights

* Integration with **AzCopy** for high-performance transfers
* Parameterized script for flexibility
* DryRun mode for safe testing
* Logging (`backup.log`)
* Error handling with `try/catch`

---

## 🧩 How It Works

1. Validates local source folder
2. Validates AzCopy installation
3. Builds AzCopy command
4. Executes upload (or simulates with DryRun)
5. Logs all operations

---

## 🔐 Security Considerations

* Requires secure handling of **Container URL (SAS token)**
* Avoid exposing credentials in scripts
* Recommended to use short-lived SAS tokens

---

## 🌍 Real-World Use Case

This script can be used to:

* Upload application data to Azure
* Perform backups from local servers
* Migrate datasets to cloud storage
* Integrate into scheduled tasks or automation workflows

---

## ▶️ Usage

```powershell
.\backup-blob.ps1 `
    -SourceFolder "C:\data" `
    -ContainerUrl "https://account.blob.core.windows.net/container?<SAS>"
```

### Dry Run

```powershell
.\backup-blob.ps1 `
    -SourceFolder "C:\data" `
    -ContainerUrl "https://account.blob.core.windows.net/container?<SAS>" `
    -DryRun
```

---

## 📊 Example Output

```
📁 Origen: C:\data
☁️ Destino: Azure Blob

🚀 Iniciando backup...
✅ Backup completado correctamente
```

---

## 🚀 Future Improvements

* Scheduled execution (Task Scheduler / Automation)
* Incremental uploads
* Integration with Azure Automation
* Use of Managed Identity instead of SAS tokens
* Monitoring and alerts

---

## 📌 Key Takeaways

This project demonstrates:

* Data transfer automation to Azure
* Use of AzCopy in real-world scenarios
* Safe scripting practices (validation, logging, DryRun)
* Hybrid cloud operational mindset

---
