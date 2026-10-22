# FIRULET MAP0.4.3 - notas de versión

Preparada para revisión; no publicada. Windows x64.

- Rejilla manual con BPM en negras, compás fijo por WAV (incluidos27/16 y23/16),
  origen configurable y figuras de redonda a semicorchea. Cambios válidos se
  aplican automáticamente y muestran la rejilla, sin cuantizar notas.
- MIDI completo/fragmento por botón o arrastre con BPM/compás configurados,
  manteniendo tiempos reales y bends. Importar respetando el tempo del archivo.
  Bar1 es visual y no desplaza MIDI; el fragmento se rebasa a0.
- Zoom de alturas y tiempo; cabecera de compás/segundos y eje de notas fijos.
  Nombres en todos los semitonos y también en notas cortas.
- UI compacta: flecha lateral y paneles plegables Grid, Analysis review, MIDI
  export y Note details; tabla de notas plegable, ajustes conservados.
- Show pitch lines y Show uncertain regions controlan guías y franjas por
  separado; ocultar franjas no elimina incertidumbre ni corrige el análisis.
- Fixes028–035: layout mínimo, scroll vertical accesible, autoaplicación de
  rejilla, visibilidad, etiquetas, redibujado de referencias y orden del backlog.

## Límites

WAV mono/estéreo PCM16/PCM24/float32 a44,1/48kHz, hasta40s.96kHz y macOS no
admitidos. Guitarra aislada monofónica; sin detección de acordes o separación.
Motor sin cambios respecto a I3: notas rápidas/graves, ligados y tapping pueden
fallar. Sin edición/persistencia, cuantización, mapas de tempo ni reanálisis local.

## Distribución y validación

Portable incluye .NET/Python privados; instalador offline para todos los usuarios
requiere administrador y reutiliza/instala .NET10 Desktop Runtime compatible.
Python privado. Actualización manual; cerrar la app antes de instalar. App/setup
sin firma digital propia. Full UAT y fixes aprobados en build0.4.0-fix3;0.4.3
identifica la entrega recompilada, no una nueva mejora de motor. Paquetes,
instalación/actualización y guías requieren revisión final. No despliegue aún.
