# Brasa 2.0.0 — local Windows x64 candidate



Status: local development candidate, 2026-11-24. No upload, publication, production installation or renewed human listening acceptance is implied.



## Changes



The approved native relic faceplate, alpha knob face and alpha four-state button atlas are embedded in the CLAP. The original PNG files are copied byte-for-byte into resources/images; artwork is loaded and cached during editor creation, with handles reused between frames. Knob lighting and wear remain fixed while vector indicators and active arcs change. Buttons use clean source rectangles from the original atlas, excluding stray alpha fringe. The dynamic upper spectrum, vector text and existing control behavior remain.



The 1400 x 700 logical canvas retains proportional 65–150% scaling and grip reset. Main knob labels are positioned above the new faceplate separator, AUTO sits beside Output, and subtle text shadows improve contrast over exposed metal. Numeric editing explicitly enables the framework prompt flag: visual/native interaction testing found it had remained disabled in the inherited custom knobs/sliders despite their tooltips.



Product/manufacturer identity, parameter IDs/defaults/state/automation, DSP and 24-sample latency are unchanged. The existing momentary auditory DELTA remains distinct from latched visual spectrum DELTA. Config string/hex, Windows PE tuple, visible status and native version assertion are all 2.0.0.



## Native raster limits



Faceplate: 1774 x 887. Knob: 1254 x 1254 with alpha. Button atlas: 1774 x 887 with alpha, four source crops of 857 x 235. Larger editor/DPI modes interpolate these images. There is no invented native 4K master. Original generated assets, prompts, manifest and approved preview are preserved.



## Validation and artifacts



Native functional tests and isolated installer checks passed. The final short diagnostic did not meet the callback CPU-overhead target; detailed results remain in the development repository. The baseline/current-spectrum CLAPs, parameter/geometry fixtures, pre-v2 working-tree diff and hashes were preserved under ignored build/v2-reference before edits.



Build: build/windows-v2/out/Brasa.clap. Local setup and ZIP: build/installer/Brasa-2.0.0-Windows-x64-Setup.exe and build/installer/Brasa-2.0.0-win-x64-installer.zip. The installer requires the same existing Windows OpenGL graphics support and remain unsigned.



## Remaining qualification

The final quiet short diagnostic failed the callback-overhead budget: comparison/delta added p99 differences of 0.1665/0.1626 ms against a 0.133333 ms limit in one phase pair. There were zero processing-time overruns, and UI p95 stayed below 8 ms. This remains a candidate, not completed CPU acceptance.




Short native diagnostics do not complete the older sustained spectrum acceptance: 600 seconds per phase, full REAPER master/seven-bus workload, driver/glitch attribution, real mouse hold/release/focus/capture cancellation, saved REAPER project compatibility, clean-machine coverage and per-monitor DPI transitions remain pending. The native injected interaction matrix checks actual editor paths, including exact numeric commit, but does not establish every physical-device/host gesture.



Published Brasa 1.0.0 packages, their historical evidence and the installed test binary remain untouched. RELEASE-1.0.0.md continues to describe that accepted release.

