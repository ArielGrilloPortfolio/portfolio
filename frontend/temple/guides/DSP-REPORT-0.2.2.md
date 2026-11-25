# Temple DSP report — 0.2.0

## Algorithm and signal order

The standalone C++17 engine has no runtime owning resources, lookahead or algorithmic latency. The plugin supports one or two channels and float/double CLAP buffers. It sanitizes nonfinite inputs to zero, bounds detector-only excitation to 1e12 to avoid power overflow, and checks final output for finiteness. Ordinary finite audio is not unity-clamped. FTZ/DAZ are scoped to ProcessBlock; the complete caller MXCSR is restored, including exception flags.

The detector HPF is a complementary one-pole low-pass subtraction: `low = (1-p)*x + p*low`, `detector = x-low`, `p = exp(-2*pi*HPF/fs)`. Its coefficients follow the smoothed HPF control. No detector filter touches dry or wet audio.

CLEAN retains the absolute peak with instantaneous acquisition and exponential Release decay. Its dB level drives the static gain curve; requested gain reduction has Attack on increasing reduction and Release on decreasing reduction. Thus recovery includes both detector decay and gain recovery. GLUE uses exponential mean-square detection with a fixed 10 ms 1/e constant, then the same curve. It runs two gain envelopes with shared Attack: fast recovery at Release and slow recovery at 4×Release, mixed 70/30 in dB. Sustained material charges the slow stage; shorter material depends more on the fast stage. Both paths run continuously and Mode crossfades their requested dB reduction.

For level `L`, threshold `T`, ratio `R`, knee `K`, and `s = 1-1/R`, requested reduction is zero below `T-K/2`, `s*(L-T+K/2)^2/(2*K)` within a nonzero knee, and `s*(L-T)` above `T+K/2`. A zero knee uses the hard threshold. Link interpolates each independent reduction toward the maximum channel reduction in dB. Wet is input multiplied by `10^(-GR/20)`.

All numeric controls, Mode and Level Match follow a 20 ms sample-clocked one-pole transition. Active and Delta use exact-endpoint 5 ms ramps. One-poles snap within 1e-10 of target to allow exact dry endpoints. Mix is a phase-aligned dry/wet linear blend; Output follows it. Active wraps both normal and audition paths. Delta is dry minus raw compressed wet, excluding matching/Mix/Output.

Level Match uses channel-averaged dry/wet mean-square envelopes with 3 s constants. A 50 ms dry-power gate above 1e-10 (-100 dB mean-square) prevents silence-driven compensation. The estimate is bounded to ±12 dB and smoothed with another 3 s constant. Wet power must exceed 1e-12. Compensation is applied to wet before Mix. Silence converges toward zero compensation; silence itself remains zero. This is not a loudness standard or integrated LUFS meter.

The processing loop allocates no memory and uses no locks, files or artwork. CLAP parameter callbacks record real-valued changes into a per-sample timeline allocated during OnReset using the host maximum block size. Repeated events for the same parameter/sample coalesce to the final value, so capacity depends on frames rather than event count. UI changes do not write this timeline. Offsets outside the declared maximum block size are invalid host input and are not queued. Audio lifecycle reset clears detectors, power estimates, audition and pending events. Prototype state loading extends the eleven serialized doubles with Level Match off before invoking the framework parser.

## Numeric tolerances and measured response

The exact static hard-knee curve is tested to 1e-12 dB. Measured CLEAN sine-wave curves use a 0.15 dB tolerance to allow detector ripple and HPF response. At a 1 kHz, 0.5 peak sine, threshold -18 dB, ratio 2 and hard knee, measured CLEAN reduction is 5.975–5.981 dB across 44.1/48/88.2/96 kHz. GLUE measures 4.487–4.490 dB because RMS level is about 3 dB below sine peak. The explicit acceptance fixture adjusts threshold to -18.020599913 dB to place 0.5 peak exactly 12 dB above it.

At 48 kHz, a 1 kHz ±0.5 square-wave step after two seconds of silent parameter warmup measures CLEAN Attack 63.2% at approximately 0.98/29.9/99.9 ms for controls 1/30/100 ms. GLUE reaches the same fraction at approximately 5.67/36.56/106.0 ms because the RMS detector adds acquisition time. CLEAN recovery to 36.8% of settled reduction is approximately 88.6/266.1/1065.1 ms for Release 50/150/600 ms. GLUE measures approximately 88.0/235.0/898.1 ms. These are fixture-specific observed responses, not a universal reinterpretation of the controls.

Timing regression windows are the greater of 2 ms or 5% around CLEAN Attack=A, recovery=1.775R; GLUE Attack=A+6.5 ms, recovery=1.47R+14 ms. They cover all 18 Attack/Release/mode combinations at 48 kHz. A separate matrix checks all supported sample rates. Stereo Link interpolation and steady Delta residue use 1e-12 precision. Equivalent global CLAP events rendered with partitions 1/63/127/1024 agree within 1e-12 for both float and double; 9000 same-sample parameter events retain the same result. The standalone engine's partition render is bit-identical.

A 30 s, -36 dB threshold / 6:1 fixture measured 24.905365 dB unmatched reduction and 12.905947 dB matched reduction: 11.999418 dB compensation, below the 12 dB bound. The slow estimator is deliberately unsuitable for instant level comparisons.

## Performance and reproducibility

One Release run measured approximately 149–152 ns per stereo sample including deterministic sine generation and measurement arithmetic, equivalent to 0.67% of one core at 44.1 kHz and 1.44% at 96 kHz. This is a local microbenchmark, not a real-host scheduling or stress acceptance threshold. Exact run values and all timing combinations are preserved in `audio-evidence/dsp-measurements.txt`. No Brasa benchmark was rerun as an acceptance substitute.

Run TempleDSPMeasure with an output directory to regenerate six-second 48 kHz stereo float WAV fixtures. Input has one second at 0.04 peak, three seconds at 0.5 peak and two seconds of silence, with the right channel at 40% of left. CLEAN/GLUE fixtures use defaults; Delta is dry minus CLEAN. Run CTest for curve, comparison, robustness, history and real CLAP integration assertions.

Reference-host renders, all-twelve-parameter disk restoration, native history and resize/Delta/Mode/Level Match interactions during Dummy Audio playback are recorded in VALIDATION.md. Physical-output listening, long playback stress and monitor DPI transitions remain unverified. Native test-host editor checks and standalone CPU figures do not establish those results.

## Active restore and representable output range

State restoration publishes an atomic parameter snapshot with an even/odd version. The audio thread consumes a consistent snapshot without spinning, initializes the pre-event values, and retains queued timestamped automation. The main thread never modifies the audio-owned timeline. Lifecycle reset consumes the current version with the current parameter values.

At the plugin boundary, output magnitude is bounded to `FLT_MAX` in both CLAP buffer formats before iPlug performs its double-to-float conversion. This representable-format bound prevents float infinities while preserving ordinary above-unity audio; it is not a full-scale limiter. Nonfinite arithmetic still recovers to zero in Core.
