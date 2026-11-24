# Brasa 1.0.0 — final release

Status: finalized and accepted by the user on 2026-11-24.

The user reported testing Brasa in REAPER with a real drum recording, said the result was very good, and explicitly requested closing this version as finalized. This is human listening acceptance for that reported use; no additional master-bus, instrument, device or lifecycle test is inferred.

## Frozen deliverable

- Product: Brasa 1.0.0, Windows x64 CLAP.
- Stable CLAP identity: org.AudioPlugins.Brasa.
- Published installer ZIP: Brasa-1.0.0-win-x64-installer.zip, 2348098 bytes.
- ZIP SHA256: 327ed1cf0674a07b4e1ae27593579564ae5ad972f19b0898610d63767da00b87.
- Installer SHA256: 98f6410a39294d02b072faa8e232f2bf5a98da87e36f7b4ca676e3165f38f69f.
- Packaged CLAP SHA256: 320be93ac8a7121fea9e0c813be7448547f9155d7c0050837370c777cf998182.
- Implementation/package source: 26915d4e007e1c511deaa8eb1e1c3d147ca43e53; closure commit changes documentation and lifecycle records only.
- Public page: https://www.arielgrillo.es/brasa/ .
- Download: https://www.arielgrillo.es/downloads/brasa/v1.0.0/Brasa-1.0.0-win-x64-installer.zip .

The published installer/ZIP and their hashes remain unchanged. Do not regenerate or overwrite the frozen 1.0.0 publication. Future functional changes require a new release version. Bundled documentation records the packaging-time state; this closure record and the current web guide record the later user acceptance.

## Evidence carried forward

Four native checks passed, including actual CLAP loading/editor/state/audio and evidence persistence. Installer install/reinstall/uninstall, ownership and in-use refusal checks passed. The guarded sustained native test completed 600.0044636 wall seconds, 224997 blocks, zero measured processing-wall overruns. Real REAPER master and bus functional checks and public ZIP/hash/range verification were recorded separately. User listening with real drums now adds explicit acceptance.

## Future coverage, outside the closed release

Broader real-master/bus and other-instrument listening, full DELTA lifecycle coverage, clean-machine/graphics and audio-driver deadline qualification remain follow-up coverage. Historical failed CPU measurements remain preserved and are not retroactively classified as harmless. The installer remains unsigned. None of these are represented as newly passed tests or an unconditional no-dropout guarantee.
