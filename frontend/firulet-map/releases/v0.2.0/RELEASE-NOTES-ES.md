# FIRULET MAP 0.2.0

19 de octubre de 2026. Versión 0.2.0 para pruebas y feedback.

## Novedades

- Dos opciones para Windows x64: ZIP portable y ZIP con instalador offline.
- El instalador se configura para todos los usuarios, requiere administrador,
  agrega accesos en Inicio y permite un acceso opcional al escritorio.
- Reutiliza .NET 10 Desktop Runtime x64 compatible (mínimo 10.0.13) o instala
  el paquete Microsoft incluido si falta. Python queda privado de la app.
- El portable conserva .NET y Python privados y no requiere instalación.
- El análisis muestra cinco etapas reales, su nombre, actividad y tiempo
  transcurrido. Las etapas tienen distinta duración: no indican un porcentaje.
- La preparación inicial puede tardar más; cancelación y reproducción siguen
  disponibles. El progreso se limpia al completar, cancelar o fallar el análisis.

## Correcciones

- Selección del PowerShell compatible para verificar la firma del paquete Microsoft.
- Coherencia entre la versión mínima de .NET requerida por el instalador y la app.
- El empaquetado incorpora el worker actual junto con la app correspondiente.

## Instalación y actualización

Portable: extraer todo FiruletMap-0.2.0-win-x64.zip y abrir FiruletMap.App.exe.
Instalable: extraer FiruletMap-0.2.0-win-x64-installer.zip y ejecutar
FiruletMap-0.2.0-win-x64-setup.exe. Cerrar la app antes de reinstalar o actualizar.
No hay actualizador automático. Un instalador anterior se rechaza si existe una
versión registrada más nueva. Desinstalar desde Aplicaciones instaladas de Windows.
Se conservan archivos personales y .NET compartido. Instalar no elimina las copias
portables anteriores: permanecen en sus carpetas.

## Alcance y comprobaciones

WAV mono PCM16, 44,1/48 kHz, hasta 40 segundos; guitarra aislada, monofónica y
con distorsión, sin otros efectos. App en inglés; guías en español e inglés.
No se distribuyen audios de prueba. Sin MIDI, edición de notas ni guardado de análisis.
El detector musical no cambia: los ocho mapas del corpus coinciden con 0.1.0.

36 pruebas C# y 5 del worker aprobadas. Comprobados cancelación, error del worker,
mapas, archivos instalados, reemplazo entre candidatos 0.2.0, desinstalación y
reinstalación. Flujo de progreso y reproducción aprobado por el usuario en Windows 11.
Las corridas observadas de FM-008 con runtime instalado fueron 41,8 s y 11,5 s;
no son una promesa de rendimiento ni un benchmark controlado en frío.

## Limitaciones conocidas

La detección sigue siendo aproximada. La app y su instalador no tienen firma digital
propia. La instalación con .NET ausente, elevación rechazada, reinicio requerido y
actualizaciones entre versiones publicadas diferentes quedan para seguimiento con
beta testers (FM-021); no se presentan como pruebas superadas.

## Feedback

https://docs.google.com/forms/d/e/1FAIpQLSff61AyI7QJ6uKt__DELQNoMDd3qc9uB71tVndK2lcOV4g_0w/viewform?usp=header

Indicá 0.2.0 (Otra si no aparece) y portable o instalador en los comentarios.
No hace falta adjuntar audio. El contacto es opcional.
