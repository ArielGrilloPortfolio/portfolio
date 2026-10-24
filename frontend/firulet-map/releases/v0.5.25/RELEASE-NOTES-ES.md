# FIRULET MAP 0.5.25 — notas de versión

Preparada en local; sin publicar. Windows x64. Full UAT desktop aceptada el
2026-10-24, incluidos los fixes hasta FM-BUG-057. La aceptación de paquetes,
instalación/actualización, guías y web sigue pendiente de sus comprobaciones.

## Iteración 5

- Save, Save as y reapertura de documentos .firulet sin repetir la detección.
  WAV separado, ruta relativa, control de identidad, relocalización del audio,
  avisos Save/Discard/Cancel y copia de la ruta del documento.
- Edición básica completa: crear/borrar, transponer semitonos/octavas, ajustar
  bordes, dividir/unir y Undo/Redo. Menú contextual con altura/límites precisos
  y acciones; sin movimiento horizontal completo ni cuantización. Crear adapta
  la duración al hueco libre y rechaza tiempos ocupados.
- Original inmutable y Edited efectivo, comparación ghost y synth local de la
  capa elegida. La curva verde medida es independiente de las correcciones.
- Anotaciones temporales sobre la onda: título/descripción, movimiento hasta
  contacto sin empujar, bordes compartidos, sin solapamiento y persistencia.
  Enter aplica en título; en descripción agrega línea; Ctrl+Enter aplica ambos.
- Reanálisis de tramos con perfiles Conservative/Balanced/Sensitive, selección
  y bordes gráficos, cursor al inicio, comparación Current/Proposal con synth,
  cancelación y Accept/Discard explícitos. Guardar/exportar mantiene Current
  hasta Accept. Protege cambios/eliminaciones reales; el historial revertido
  no bloquea. Restaurar detección desde el menú requiere confirmación y tiene Undo.
- Confirmación manual de incertidumbre individual/grupal, también con notas
  editadas o bends. Edited y Manually confirmed son datos separados; conserva
  evidencia original. Cambios musicales posteriores invalidan la confirmación.
- Bends manuales ascendentes de0,5–2 semitonos, uno por nota; Set/Edit, presets,
  controles de fase dorados y aplicación al soltar; Esc cancela. Ajustar tiempos
  puede conservar la altura exacta de un bend detectado mayor; reemplazar pide
  confirmación. Synth y MIDI usan bends efectivos; MIDI conserva rango de±12.
- Ayuda de atajos (? / F1), archivos, reproducción, edición y gestos contextuales.
  Paneles compactos y zoom vertical que escala bloques/trazos. La propuesta
  pendiente llama la atención con un pulso; el modo de sección explica cómo
  cerrarlo para volver a editar.
- Fixes FM-BUG-036–057: documentos, selección/reproducción, anotaciones,
  reanálisis, confirmación, conservación de bends/curva medida y ajustes de UAT.

## Funciones conservadas y límites

MIDI completo/fragmento por archivo o arrastre, BPM en negras/compás fijo
(incluidos27/16 y23/16),960PPQ y tiempos reales sin cuantización. Bar1 es visual;
fragmentos desde0. Escuchar Original/Proposal no cambia la exportación Edited/
Current. Solo guitarra aislada monofónica; detección aproximada. WAV mono/estéreo
PCM16/PCM24/float32,44,1/48kHz, hasta40s. Sin96kHz, macOS, polifonía, grabación,
mapas de tempo, cuantización, pestañas múltiples ni modelos remotos.

## Distribución

Portable con .NET/Python privados. Instalador offline para todos los usuarios,
requiere administrador, reutiliza/instala .NET10 Desktop Runtime compatible y
mantiene Python privado. Actualización manual con app cerrada; sin firma propia.
Sin audios de ejemplo. Las pruebas en Windows limpio/sin runtime siguen diferidas.
135 tests del motor y UAT nativa/app/REAPER complementan las pruebas de paquetes;
no implican nuevas métricas de precisión ni validación en Windows limpio.
