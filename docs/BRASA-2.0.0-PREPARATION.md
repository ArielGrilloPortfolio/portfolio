# Brasa 2.0.0 - publicación preparada

Estado: esperando subida manual y confirmación del usuario. ZIP verificado localmente (CRC y EXE exacto), 8475257 bytes, SHA256 72a0862cecc85cfcae153d7e7d0e8222d9fffb150971df34cf8045830d783379. Candidato de desarrollo: el gate de sobrecosto CPU sigue fallando. El instalador local y smoke aislado ya fueron verificados; los binarios no se recompilaron innecesariamente.

La ficha con nueva captura real, analizador, estado candidato y descarga histórica v1 está preparada en `.local/release-assets/brasa/v2.0.0/website/`. No se modificó frontend ni se activó la descarga sin verificar. Tras confirmación: verificar ZIP HTTPS completo/sidecar, aplicar los archivos preparados conservando las guías/imagen v1, commit/push por deploy existente y verificar web.

En PowerShell:

```powershell
$releaseDir = 'C:\Code\portfolio\.local\release-assets\brasa\v2.0.0'
scp "$releaseDir\Brasa-2.0.0-win-x64-installer.zip" "$releaseDir\Brasa-2.0.0-win-x64-installer.zip.sha256" "$releaseDir\install-brasa-release-2.0.0.sh" root@217.160.228.106:/root/
ssh root@217.160.228.106
```

En la VPS:

```bash
bash /root/install-brasa-release-2.0.0.sh /root --verify-only
bash /root/install-brasa-release-2.0.0.sh /root
```

Destino: /srv/firulet-map/releases/brasa/v2.0.0/. Alias actual ya configurado: /downloads/brasa/. No requiere cambios Nginx. El helper fija hashes, no descarga nada, conserva v1 y rechaza sobrescribir archivos diferentes. No se usó SSH/SCP desde el asistente.

## Confirmado y verificado - 2026-11-25

El usuario confirmó la subida. ZIP HTTPS completo: HTTP200, 8475257 bytes y SHA256 correcto; sidecar coincide. Se aplicó la ficha preparada con captura real nativa, analizador, estado candidato/CPU pendiente, guía inglesa y v1 preservada. Se publica por el deploy existente, sin nuevas transferencias/Actions ni cambios de Nginx.
