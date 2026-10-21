# FIRULET MAP 0.3.3

Entrega de la iteración 3. Preparada para revisión; todavía no publicada.

- Motor: mejor separación de repeticiones y ligados, con sensibilidad adaptativa
  en pasajes corroborados por el audio. Mejora acotada de saltos de tapping.
- Onda sobre el mapa, selección y cursor compartidos, zoom con rueda/slider,
  Fit note, Full clip y Previous/Next con reproducción automática.
- WAV mono/estéreo PCM16, PCM24 y float32 a44,1/48kHz, hasta40s. Preparación
  local compatible sin alterar el archivo original; análisis automático al abrir.
- Synth local para contrastar las notas con el original, conservando posición
  y transporte. Sonido único y bends probables; no reproduce toda la curva/vibrato.
- Exportación MIDI completa o por rango, mediante botón y arrastre al DAW.
  Notas recortadas al rango, origen0 y silencios conservados. Tempo técnico60BPM,
  960PPQ y velocidad100; el DAW debe respetar el tempo para conservar segundos.
  Pitch bend ±12semitonos mediante RPN0; configurar un instrumento compatible.
- Fixes: contraste de curva/bloques (FM-BUG-016), repeticiones/ligados/tapping
  (020/021/022), fluidez al maximizar/arrastrar zoom (023), Space durante la
  preparación del synth (024) y ruta física del MIDI arrastrado (025).

La Full UAT en la app0.3.3 y REAPER está aprobada. Los paquetes recompilados y
el sitio se verifican por separado; no se infiere una prueba en máquina limpia.

Dos descargas Windows x64: portable con .NET/Python privados e instalador offline
para todos los usuarios, con .NET Desktop Runtime compartido compatible y Python
privado. Actualización manual: cerrar la app y ejecutar el instalador nuevo.
La app y el instalador no tienen firma digital propia.

Detección aproximada: notas graves rápidas, ataques débiles y tapping pueden
fallar. Guitarra aislada y monofónica; no acordes ni separación de instrumentos.
No edición de notas, guardado de análisis, pestañas ni rejilla musical configurable.
No se incluyen grabaciones de prueba. Guías ES/EN y feedback disponibles.
