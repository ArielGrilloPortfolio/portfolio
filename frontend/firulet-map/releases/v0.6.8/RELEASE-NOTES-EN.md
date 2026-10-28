# FIRULET MAP 0.6.8

28 October 2026. Iteration 6: engine improvements. Packages prepared; public release and installation/upgrade acceptance remain pending.

## Changes

- Better separation of some repeated notes using attack, envelope and stable-pitch evidence, including distorted recordings. Detection does not use BPM, meter, MIDI or quantization.
- Retain supported short notes and fill only corroborated pitch gaps, keeping the previous estimate as fallback.
- Bounded local alignment of rejected onset candidates without displacing accepted cuts or globally increasing sensitivity. DI FM-008 now separates both G4 notes and retains both bends.
- More continuous DI bends across brief quiet gaps, without changing the measured pitch curve.
- Original WAV path displayed beside Waveform · note intervals.

## Retained workflows

.firulet documents with separate WAV, note and bend editing/confirmation, Original/Edited layers, time annotations, section reanalysis with Current/Proposal and Accept/Discard, Undo/Redo, grid, zoom, local synth, and full/fragment MIDI export by button or drag. Actual performance timing is not quantized.

## Try the new detection

Opening a .firulet preserves its saved result. To compare, open the original WAV and save the new analysis under another name; keep a copy of an older document containing corrections. Section reanalysis remains optional and requires Accept to apply its proposal.

## Known limits

Improvement depends on the recording and does not guarantee recovery of every note. Saturated repetitions, fast or weak notes, bass, legato and tapping can still fail. Clean and distorted signals may produce different results. No new engine dropdown, remote inference, automatic BPM/meter detection, polyphony, tempo maps, quantization, multiple tabs, 96 kHz or macOS.

Alternative engines and classifier trials did not justify integration. Detection remains local: pYIN with conservative selection and native segmentation. Development evaluation does not establish generalization to new recordings.

## Input and distribution

Windows x64. Isolated monophonic guitar, mono/stereo PCM16, PCM24 or float32 WAV, 44.1/48 kHz, up to 40 s. Portable with private .NET/Python, or all-users installer with compatible .NET 10 runtime and private Python. Manual updates: close the app before running setup. App and setup still lack their own code-signing certificate. Original WAV files are not modified or automatically uploaded.

## Validation

User-accepted native 0.6.8 UAT and 161 passing C# tests. A 21-clip corpus retains 536/732 matches, 92 unmatched predictions and 7 reference bends. Turbulence clean 116/124 (4 unmatched), distorted 79/124 (28 unmatched). These are reviewed development acoustic references, not general accuracy percentages or every possible note. FM-025 remains reserved, unscored and unused for tuning.

Public download verification and installation/upgrade acceptance are separate checks after the authorized upload.
