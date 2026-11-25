# Temple 0.2.2

Temple is a zero-latency Windows x64 CLAP stereo bus compressor with CLEAN peak and GLUE RMS responses. REAPER is the reference host. Neither response intentionally adds saturation or emulates an analog circuit.

The 1400 × 910 editor preserves the History first composition with a Temple-specific relic housing, independently rendered circular corner screws and shared relic knob/button artwork. Drag the corner grip for 65–150% scaling; double-click it for 100%. Drag knobs, use Shift for fine adjustment, click a numeric value or right-click to type, and double-click a knob to reset.

| Parameter | Default | Range |
| --- | --- | --- |
| Threshold | -18 dB | -36–0 dB |
| Ratio | 2:1 | 1–6:1 |
| Attack | 30 ms | 1–100 ms |
| Release | 150 ms | 50–600 ms |
| Knee | 6 dB | 0–12 dB |
| Detector HPF | 80 Hz | 20–250 Hz |
| Stereo Link | 100% | 0–100% |
| Mix | 100% | 0–100% |
| Output | 0 dB | -12–12 dB |
| Mode | CLEAN | CLEAN / GLUE |
| Active | On | Off / On |
| Level Match | Off | Off / On |

CLEAN uses a feed-forward peak detector and soft-knee gain curve. GLUE uses a 10 ms RMS power detector and two recovery stages: 70% at Release and 30% at four times Release. Attack controls the 1/e gain-reduction smoothing coefficient in both modes. These controls describe internal time constants, not universal end-to-end settling times; the detector also affects measured response. See [DSP-REPORT-0.2.2.md](DSP-REPORT-0.2.2.md) for timing conventions and measurements.

Detector HPF filters only the detector. Stereo Link moves the weaker requested gain reduction toward the stronger in dB: 0% is independent, 80% moves 80% of the difference, and 100% applies identical gain to both channels. Mono uses one detector.

The normal signal order is compressed wet → optional Level Match → phase-aligned Mix with dry → Output → Active. Level Match estimates mean-square dry/wet power with slow 3 s envelopes and a 50 ms silence gate, with compensation bounded to ±12 dB. It is an approximate listening aid; it is not integrated LUFS normalization. Allow time for convergence. Output can exceed full scale; Temple does not limit ordinary finite audio to unity.

Hold Delta to hear dry minus compressed before Mix, Output and Level Match. Release the mouse to return. Lost focus/capture, editor close, state restore and deactivation release audition; offline rendering cancels it immediately. Delta is never saved or automated. Active bypass transitions over 5 ms and then returns exact dry. Settled Mix 0% with Output 0 dB also returns exact dry. Parameter transitions use sample-clocked smoothing.

History shows actual input peak (ivory), final audible output peak (amber), and maximum pre-mix compression reduction (green) per 10 ms. The amplitude display spans 0 to -36 dBFS; the separate GR band spans 0 to 24 dB. Four seconds are retained. Display clipping does not clip audio. A bounded lock-free queue drops visual updates when full and discards stale editor/lifecycle generations. Stopped callbacks freeze the history. The adjacent analog needle reads the same strongest-channel post-link GR, before Mix, Output, Level Match and Delta. It has display-only 120 ms rise / 300 ms return ballistics, a nonlinear 0–20 dB scale (0 at the right) and a smoothed numeric reading that can exceed 20 dB. Active off returns the needle to zero. When callbacks stop, a 250 ms visual timeout releases the needle to zero; this is not a measurement of new audio. Reopening or restoring clears the display. No meter processing changes the audio.

The original eleven parameter IDs/defaults/ranges are unchanged. Level Match is appended as ID 11. Prototype eleven-double states restore their original values with matching off. A Windows x64 per-user installer is available as a 0.2.2 development candidate; see [INSTALLATION-0.2.2.md](INSTALLATION-0.2.2.md). Listening qualification remains pending. Packaging and native checks do not establish listening acceptance. Original UI evidence remains in initiative-temple/ui-evidence; its prototype labels describe the earlier build.
