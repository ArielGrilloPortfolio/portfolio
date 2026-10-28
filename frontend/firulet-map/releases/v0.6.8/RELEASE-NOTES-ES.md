# FIRULET MAP 0.6.8

28 de octubre de 2026. Iteración 6: mejoras del motor. Paquetes preparados; publicación y validación de instalación/actualización pendientes.

## Qué cambia

- Mejor separación de algunas notas repetidas con evidencia de ataque, envolvente y altura estable, incluso con distorsión. No introduce BPM, compás, MIDI ni cuantización en la detección.
- Conserva notas breves respaldadas por la señal y rellena únicamente huecos de afinación corroborados, con el resultado anterior como respaldo.
- Alineación local acotada de candidatos de ataque rechazados, sin desplazar cortes ya aceptados ni relajar la sensibilidad global. En DI FM-008 separa los dos G4 y conserva ambos bends.
- Mayor continuidad de bends en DI con caídas breves de nivel, sin cambiar la curva de afinación medida.
- La ruta del WAV original aparece junto a Waveform · note intervals.

## Se conserva

Documentos .firulet con WAV separado, edición y confirmación de notas/bends, capas Original/Edited, anotaciones temporales, reanálisis con Current/Proposal y Accept/Discard, Undo/Redo, rejilla, zoom, synth local y exportación MIDI completa o por fragmento mediante botón o arrastre. Los tiempos reales no se cuantizan.

## Cómo probar la nueva detección

Abrir un .firulet conserva su resultado guardado. Para comparar, abrí el WAV original y guardá el análisis nuevo con otro nombre; conservá una copia de un documento anterior que tenga correcciones. El reanálisis de secciones sigue siendo opcional y requiere Accept para aplicarse.

## Límites reales

La mejora depende de la grabación: no garantiza recuperar todas las notas. Algunas repeticiones saturadas, notas rápidas o débiles, graves, ligados y tapping todavía pueden fallar. Las señales clean y distorsionadas pueden dar resultados distintos. No hay nuevos motores seleccionables, servicios remotos, detección automática de BPM/compás, polifonía, mapas de tempo, cuantización, pestañas múltiples, 96 kHz ni macOS.

Los ensayos con otros motores y clasificadores no justificaron integrarlos. La detección sigue siendo local, pYIN con selección conservadora y segmentación propia. La evaluación de desarrollo no equivale a generalización sobre grabaciones nuevas.

## Entrada y distribución

Windows x64. Guitarra aislada y monofónica, WAV mono/estéreo PCM16, PCM24 o float32, 44.1/48 kHz, hasta 40 s. Portable con .NET/Python privados, o instalador para todos los usuarios con runtime .NET 10 compatible y Python privado. Actualización manual; cerrá la app antes de ejecutar el instalador. App e instalador siguen sin firma propia. El WAV original no se modifica ni se sube automáticamente.

## Validación

UAT nativa 0.6.8 aceptada por el usuario y 161 pruebas C# aprobadas. Corpus de 21 clips conserva 536/732 coincidencias, 92 predicciones sin correspondencia y 7 bends de referencia. Turbulence clean 116/124 (4 sin correspondencia), distorsionada 79/124 (28 sin correspondencia). Son referencias acústicas revisadas de desarrollo, no porcentajes de precisión general ni todas las notas posibles. FM-025 sigue reservado, sin puntuar ni ajustar sobre él.

La publicación pública y la instalación/actualización de estos ZIPs se verifican por separado después de la carga autorizada.
