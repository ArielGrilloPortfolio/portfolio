# Publicación de descargas FIRULET MAP

Acuerdo vigente del usuario,2026-10-29. Este procedimiento reemplaza el flujo
adicional de subida automática creado para el preview I7:S6.

## Responsabilidades y secuencia obligatoria

1. El asistente prepara los ZIPs de distribución, sus SHA256 y el helper manual
   de instalación en VPS, con hashes fijados y sin descargas desde otros servicios.
   El ZIP del instalador Windows contiene el EXE; el ZIP Mac contiene la .app.
2. El asistente entrega al usuario los comandos completos y concretos para cada
   publicación: rutas locales exactas, nombres de archivos, destino SCP, acceso
   SSH, verificación y colocación de los ZIPs en el directorio público de la VPS.
3. El usuario sube los ZIPs y ejecuta los comandos de la VPS por su cuenta.
   El asistente espera su confirmación; no transfiere archivos por SSH/SCP,
   GitHub Releases, Actions, ni mecanismos alternativos.
4. Tras la confirmación, el asistente verifica las descargas públicas completas
   y sus SHA256. Si fallan o faltan archivos, no activa los enlaces nuevos.
5. Solo entonces modifica la web, hace commit y push del cambio revisado.
   La Action existente .github/workflows/ci-cd.yml despliega la web.
6. Comprueba el despliegue y los enlaces publicados. Mantiene versiones anteriores
   y distingue candidatos experimentales de versiones aceptadas.

## Formato de los comandos que debe entregar el asistente

Los siguientes son ejemplos de formato, no una nueva subida pendiente. En cada
publicación el asistente debe sustituir todos los marcadores por datos reales.

```powershell
# En el equipo del usuario: archivos de la publicación preparada
$releaseDir = 'C:\Code\spec-driven-creation\firulet-map\.local\releases\<publicacion>'
scp "$releaseDir\<portable>.zip" "$releaseDir\<portable>.zip.sha256" "$releaseDir\<instalador>.zip" "$releaseDir\<instalador>.zip.sha256" "$releaseDir\<mac>.zip" "$releaseDir\<mac>.zip.sha256" "$releaseDir\install-firulet-release-<publicacion>.sh" root@217.160.228.106:/root/
ssh root@217.160.228.106
```

```bash
# En la VPS: primero validar los archivos subidos, luego colocarlos
bash /root/install-firulet-release-<publicacion>.sh /root --verify-only
bash /root/install-firulet-release-<publicacion>.sh /root
```

El helper de cada publicación solo utiliza archivos ya subidos por el usuario,
verifica hashes, rechaza sobrescribir archivos distintos y conserva versiones
anteriores. Directorio público: /srv/firulet-map/releases/<publicacion>/.
URL: https://www.arielgrillo.es/downloads/firulet-map/<publicacion>/.

No se solicitan contraseñas por chat ni se reutilizan secretos de Actions para
subir binarios. No crear nuevas Actions de transferencia ni nuevas publicaciones
en GitHub Releases como transporte sin una nueva petición explícita del usuario.

## Estado histórico

La Action adicional publish-firulet-preview.yml se retira. La de deploy
ci-cd.yml se conserva sin modificaciones. Los archivos ya publicados, los assets
históricos de GitHub y el helper histórico del preview permanecen intactos;
no deben reutilizarse como procedimiento para futuras subidas automáticas.
