# FIRULET MAP 0.5.25 — release notes

Prepared locally; not published. Windows x64. Full desktop UAT accepted on
2026-10-24, including fixes through FM-BUG-057. Package/installation/upgrade
and guide/site acceptance remain separate pending delivery checks.

## Iteration 5

- Save, Save as and reopen .firulet documents without rerunning detection.
  WAV stays separate; relative location, identity checks, missing-audio relink,
  Save/Discard/Cancel and copy-path affordance.
- Basic complete note editing: create/delete, semitone/octave transpose, resize,
  split/join and Undo/Redo. Context menus offer precise pitch/bounds and other
  commands; no whole-note horizontal movement or quantization. New notes fit
  available gaps; occupied time stays rejected.
- Immutable Original versus effective Edited, ghost comparison and local synth
  of the chosen foreground only. Measured green pitch stays independent of edits.
- Single-lane timed annotations above waveform: title/description, movement to
  contact without pushing, shared-edge resizing, no overlap and persistence.
  Enter applies title; description Enter adds a line; Ctrl+Enter applies either.
- Bounded section reanalysis with Conservative/Balanced/Sensitive segmentation,
  drawing/resizing, cursor anchor, Current/Proposal and synth comparison,
  cancellation and explicit Accept/Discard. Save/export keeps Current until
  Accept. Actual corrections/deletions protected; reverted history alone does
  not block. Context command restores detected results with confirmation/Undo.
- Manual uncertainty confirmation, single/group, including edited bent notes.
  Edited and Manually confirmed remain separate; source evidence is preserved.
  Later musical changes invalidate confirmation. Undo/Redo and persistence.
- Manual upward bends (0.5–2 semitones), one per note; Set/Edit, presets and gold
  phase handles commit on release, Esc cancels. Detected-height timing edits may
  preserve exact larger excursion; replacement confirmation protects evidence.
  Synth and MIDI use effective bends; MIDI remains ±12-semitone range.
- Keyboard help (? / F1), file/playback/editing shortcuts and context gestures.
  Compact panels; pitch zoom scales notes and curves. Pending proposals show
  an attention pulse, section mode explains how to close it and resume editing.
- Fixes FM-BUG-036–057 cover document lifecycle, selection/playback, annotations,
  reanalysis, confirmation, bend preservation, source curve and UAT refinements.

## Retained behavior and limits

Full/fragment MIDI by file or drag, configured quarter-note BPM/fixed meter
(including27/16 and23/16),960PPQ, real times without quantization. Bar1 origin is
visual; fragments rebase to0. Original/Proposal preview does not change exported
Edited/Current. Isolated monophonic guitar only; detector remains approximate.
Mono/stereo PCM16/PCM24/float32 WAV,44.1/48kHz, up to40s. No96kHz, macOS,
polyphony, recording, tempo maps, quantization or multiple tabs. No remote model.

## Distribution

Portable bundles private .NET/Python. Offline per-machine installer requires
administrator access, reuses/installs compatible .NET10 Desktop Runtime and
keeps Python private. Manual updates; close the app first. No own code signing.
No sample audio included. Clean-machine/runtime-absent tests remain deferred.
135 engine tests and native app/REAPER UAT supplement package checks; do not
imply a new instrument accuracy benchmark or clean Windows validation.
