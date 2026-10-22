# FIRULET MAP0.4.3 - release notes

Prepared for review; not published. Windows x64.

- Manual quarter-note BPM grid with one fixed meter per WAV (including27/16 and
  23/16), configurable bar origin and whole-to-sixteenth note values. Valid
  edits automatically apply/show the grid without quantizing detected notes.
- Full/range MIDI via save or drag carries configured tempo/meter, preserving
  real timing and probable bends. Honor file tempo on import. Bar1 origin is
  visual only; fragments rebase to0 while retaining rests.
- Time and pitch zoom; fixed bar/seconds ruler and pitch references. All semitone
  names and short-note labels are shown.
- Compact workspace: edge arrow and collapsible Grid, Analysis review, MIDI
  export and Note details; collapsible note table and retained settings.
- Show pitch lines and Show uncertain regions independently control guides and
  diagnostic shading. Hiding shading does not remove uncertainty or fix analysis.
- Fixes028–035: minimum-size layout, accessible pitch scroll, automatic grid
  application, visibility, labels, ruler redraw and backlog session ordering.

## Limitations

Mono/stereo PCM16/PCM24/float32 WAV at44.1/48kHz, up to40s.96kHz/macOS unsupported.
Isolated monophonic guitar; no chords or source separation. Engine unchanged
from I3: fast/low notes, legato and tapping may fail. No note editing, saving
analyses, quantization, tempo maps or local reanalysis.

## Distribution and validation

Portable includes private .NET/Python. Offline per-machine installer requires
administrator access and reuses/installs compatible .NET10 Desktop Runtime;
Python stays private. Manual updates; close the app before installing. App/setup
have no own code-signing certificate. Full UAT/fixes accepted on0.4.0-fix3;
0.4.3 is the rebuilt release identity, not a new engine improvement. Packages,
installation/upgrade and guides require final review. No deployment yet.
