# FIRULET MAP0.5.26 — mantenimiento

Preparada, sin publicar. Windows x64. Fix FM-BUG-058 validado por el usuario.

- Corrige el falso error “The working analysis changed. Retry this range.” al
  reanalizar un WAV recién abierto, sin tener que guardar/reabrir el .firulet.
- Documento, mapa y onda usan el mismo resultado efectivo. Se conserva Original
  independiente y la protección frente a propuestas realmente obsoletas.
- Reanálisis, Discard, Accept y Undo aceptados en la app0.5.26.

135tests del motor y regresión WPF con FM008 y clip1_mono_145_4-4: propuesta
sin guardar antes, descartar/aceptar, Undo/Redo, guardar/reabrir y rechazo real
por cambios de origen. No se cambian detector, formatos, edición ni flujo de uso.

Todas las funciones y límites de0.5.25 se mantienen. Las guías ES/EN solo
actualizan versión/nombres, sin cambios funcionales. Portable/instalador nuevos
requieren revisión de entrega; no se hereda una validación de actualización
0.5.25→0.5.26 que no se haya realizado. Sin despliegue ni publicación todavía.
