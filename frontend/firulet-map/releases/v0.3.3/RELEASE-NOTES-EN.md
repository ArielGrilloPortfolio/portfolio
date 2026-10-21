# FIRULET MAP 0.3.3

Iteration3 delivery. Prepared for review; not yet published.

- Engine: improved repeated-note and legato separation with adaptive sensitivity
  in audio-corroborated passages. Bounded improvement to tapping pitch jumps.
- Waveform above the map, shared selection/cursor, wheel/slider zoom, Fit note,
  Full clip and Previous/Next autoplay.
- Mono/stereo PCM16, PCM24 and float32 WAV at44.1/48kHz, up to40s. Local
  compatibility preparation preserves the source; opening starts analysis.
- Local synth to compare detected notes against the original, preserving
  transport and position. One tone and probable bends, not full pitch/vibrato.
- Full/range MIDI export through saving or native drag to a DAW. Crossing notes
  clipped, range rebased to0, rests retained. Technical60BPM,960PPQ,velocity100;
  the receiving DAW must honor tempo to preserve seconds. Pitch bend ±12semitones
  through RPN0 requires an instrument honoring/configured for that range.
- Fixes: note/pitch contrast (FM-BUG-016), repetitions/legato/tapping (020/021/022),
  maximized zoom responsiveness (023), Space during synth preparation (024),
  and physical staged-MIDI paths for external drag (025).

Native0.3.3 app/REAPER Full UAT is approved. Rebuilt packages and website are
verified separately; no clean-machine acceptance is inferred.

Two Windows x64 downloads: portable with private .NET/Python, and an offline
per-machine installer with compatible shared .NET Desktop Runtime and private
Python. Manual update: close the app and run the new installer. The application
and installer do not have their own digital signature.

Approximate detection: fast low notes, weak attacks and tapping may fail. Isolated
monophonic guitar only; no chords or instrument separation. No note editing,
saved analyses, tabs or configurable musical grid. No test recordings included.
Spanish/English guides and feedback link are provided.
