# Brasa 1.0.0 - preparación para el portfolio

Estado: el usuario confirmó la subida y la ejecución del helper el 24 de noviembre de 2026. El ZIP público completo, sidecar y rango HTTP206 coinciden con el paquete preparado. La ficha y la tarjeta están verificadas localmente y listas para el deploy existente. Los comandos siguientes se conservan como trazabilidad; no hace falta repetir la subida. El repositorio de Brasa está subido a GitHub hasta26915d4.

Se aplica la secuencia de docs/firulet-map-publication.md por solicitud del usuario: el asistente prepara, el usuario sube los binarios y ejecuta el helper, el asistente verifica las descargas públicas y recién después modifica y publica la web. No se creó otra Action ni se usó SSH/SCP desde el asistente.

## Archivos preparados

Carpeta local: `C:\Code\portfolio\.local\release-assets\brasa\v1.0.0`.

- `Brasa-1.0.0-win-x64-installer.zip`: instalador Windows x64, guía de instalación inglesa, README, avisos de terceros y manifiesto interno.
- `Brasa-1.0.0-win-x64-installer.zip.sha256`.
- `install-brasa-release-1.0.0.sh`: helper con hashes fijados, sin descargas externas, modo --verify-only sin escritura e instalación atómica de archivos faltantes. Rechaza archivos diferentes en una publicación existente.

ZIP: 2348098 bytes; SHA256 `327ed1cf0674a07b4e1ae27593579564ae5ad972f19b0898610d63767da00b87`. El EXE incluido coincide con el instalador final probado: SHA256 `98f6410a39294d02b072faa8e232f2bf5a98da87e36f7b4ca676e3165f38f69f`. El instalador no tiene firma digital.

## Comandos exactos para el usuario

En PowerShell de Windows:

```powershell
$releaseDir = 'C:\Code\portfolio\.local\release-assets\brasa\v1.0.0'
scp "$releaseDir\Brasa-1.0.0-win-x64-installer.zip" "$releaseDir\Brasa-1.0.0-win-x64-installer.zip.sha256" "$releaseDir\install-brasa-release-1.0.0.sh" root@217.160.228.106:/root/
ssh root@217.160.228.106
```

En la VPS:

```bash
bash /root/install-brasa-release-1.0.0.sh /root --verify-only
bash /root/install-brasa-release-1.0.0.sh /root
```

El helper reutiliza el almacenamiento de descargas existente, en un subdirectorio propio: `/srv/firulet-map/releases/brasa/v1.0.0/`. No cambia Nginx ni la web. Esto permite verificar el archivo antes de activar la nueva ficha, sin desplegar enlaces rotos ni modificar la Action actual.

URL de verificación previa, disponible tras ejecutar el helper: `https://www.arielgrillo.es/downloads/firulet-map/brasa/v1.0.0/Brasa-1.0.0-win-x64-installer.zip`. No se considera publicada o verificada hasta comprobar el stream HTTPS completo y su sidecar después de la confirmación del usuario.

## Incorporación web pendiente

Tras la confirmación de subida y verificación: añadir ficha propia `/brasa/`, tarjeta en Proyectos personales, imagen real del plugin, controles y requisitos Windows x64/CLAP/REAPER. Mantener las limitaciones auditivas/driver documentadas, sin prometer equivalencia con Decapitator. La aplicación y sus documentos técnicos están en inglés; la presentación puede seguir el idioma español del portfolio.

La descarga visible propuesta será `/downloads/brasa/v1.0.0/Brasa-1.0.0-win-x64-installer.zip`, con un alias de Nginx al mismo directorio ya verificado. Ese alias y la ruta exacta de `/brasa/` se incorporarán junto con la página, después de la subida. Verificar ambos tras el deploy existente. No mezclar ni reemplazar las versiones de FIRULET MAP.

## Verificación local

CRC del ZIP y hashes de cada archivo incluido comprobados contra los originales. Helper validado con Git Bash: sintaxis, --verify-only sin escrituras, instalación y repetición idéntica, rechazo de destino diferente, conservación de archivo ajeno y rechazo de subida corrupta. Las pruebas usaron un destino temporal aislado dentro de .local, limpiado al terminar. Evidencia: BRASA-1.0.0-LOCAL-VERIFICATION.json. Los binarios permanecen ignorados por Git.

## Verificación y ficha preparada - 2026-11-24

Confirmación del usuario recibida antes de cualquier cambio web. La descarga HTTPS completa devolvió2348098bytes y SHA256327ed1cf0674a07b4e1ae27593579564ae5ad972f19b0898610d63767da00b87; sidecar y Range0-3/HTTP206 correctos. Evidencia: BRASA-1.0.0-PUBLIC-DOWNLOAD-VERIFICATION.json.

Se añadió ficha inglesa /brasa/, tarjeta en Proyectos personales, captura auténtica de v1.0.0 en una sesión aislada de REAPER, guía inglesa y alias /downloads/brasa/ al mismo archivo ya verificado. UI revisada en escritorio y móvil390x844; imagen cargada, sin desborde horizontal y ancla de descarga funcional. Los enlaces/archivos locales y el ZIP de preview coinciden con el hash esperado. No cambió el workflow de deploy ni se enviaron binarios desde el asistente.

## Publicado y verificado - 2026-11-24

La Action existente Deployment-Portfolio45462421044 finalizó correctamente para ce324f7546cb9ac64f142c5aa54d739705c21de0. Ficha pública: https://www.arielgrillo.es/brasa/ . La tarjeta aparece junto a FIRULET MAP en Proyectos personales y su navegación fue observada en el navegador.

El HTML, CSS, captura y guía publicados coinciden byte a byte con los blobs del commit (la conversión CRLF del working tree Windows se distingue de los bytes de Git). ZIP canónico completo2348098bytes/SHA256correcto, sidecar y HTTP206 verificados; /brasa redirige a /brasa/, un ZIP inexistente devuelve404 y FIRULET MAP sigue accesible. Evidencia: BRASA-1.0.0-WEBSITE-PUBLICATION-VERIFICATION.json.

La Action de deploy se conserva sin modificaciones. Binarios subidos exclusivamente por el usuario; no se usaron otros mecanismos de transporte. La documentación de preparación y comandos anteriores queda como historial, no como una subida pendiente.
