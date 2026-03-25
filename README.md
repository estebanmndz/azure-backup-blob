# 💾 Backup Folder to Azure Blob Storage (AzCopy)

## 🧠 Descripción

Este proyecto automatiza el backup de carpetas locales hacia Azure Blob Storage utilizando AzCopy, una herramienta optimizada para transferencias de datos a gran escala.

El script está diseñado para simular escenarios reales de backup en entornos cloud, incorporando validaciones, logging y ejecución controlada.

---

## ☁️ Caso de uso

Permite realizar copias de seguridad rápidas y eficientes desde sistemas locales hacia almacenamiento en Azure, útil en escenarios como:

* Backups de servidores on-premise
* Migración de datos a cloud
* Sincronización de archivos

---

## ⚙️ Características técnicas

* Uso de AzCopy (alto rendimiento)
* Soporte para autenticación mediante SAS Token
* Script parametrizado
* Validación de rutas y dependencias
* Logging detallado en fichero
* Modo simulación (**DryRun**)

---

## ▶️ Uso

```powershell
# Simulación
.\backup.ps1 `
  -SourceFolder "C:\Backup" `
  -ContainerUrl "https://<storage>.blob.core.windows.net/backups?<SAS>" `
  -DryRun

# Ejecución real
.\backup.ps1 `
  -SourceFolder "C:\Backup" `
  -ContainerUrl "https://<storage>.blob.core.windows.net/backups?<SAS>"
```

---

## 📊 Output

```
📁 Origen: C:\Backup
☁️ Destino: Azure Blob

🚀 Iniciando backup...
✅ Backup completado correctamente
```

Se genera un fichero `backup.log` con el detalle completo de la ejecución.

---

## ⚠️ Consideraciones

* Requiere AzCopy instalado
* El SAS Token debe tener permisos de escritura
* Revisar caducidad del SAS
* Ejecutar en modo DryRun antes de producción

---

## 🚀 Mejoras futuras

* Integración con Azure Key Vault para gestión de secretos
* Automatización mediante Task Scheduler / Azure Automation
* Soporte incremental
* Notificaciones (email / webhook)
