# FIRULET MAP 0.2.0

19 October 2026. Version 0.2.0 for testing and feedback.

## What's new

- Two Windows x64 downloads: portable ZIP and ZIP containing the offline installer.
- The installer requires administrator permission, installs for all users, creates
  Start menu entries and offers an optional desktop shortcut.
- Reuses a compatible .NET 10 Desktop Runtime x64 (minimum 10.0.13), or installs
  the included Microsoft package if absent. Python stays private to the app.
- The portable retains private .NET/Python and needs no installation.
- Analysis shows five real stages, their names, activity and elapsed time. Stages
  have different durations; their position is not a time-based percentage.
- Initial preparation may take longer. Playback and cancellation stay available;
  completion, cancellation and errors clear the progress display.

## Fixes

- Compatible PowerShell selection for Microsoft package signature verification.
- Consistent minimum .NET requirement between installer and application.
- Packaging includes the current worker alongside the corresponding application.

## Installation and updates

Portable: extract all of FiruletMap-0.2.0-win-x64.zip and run FiruletMap.App.exe.
Installer: extract FiruletMap-0.2.0-win-x64-installer.zip and run
FiruletMap-0.2.0-win-x64-setup.exe. Close the app before reinstalling or updating.
There is no automatic updater. Older installers are rejected when a newer version
is registered. Uninstall through Windows Installed apps. Personal files and shared
.NET are preserved. Installing does not remove older extracted portable copies.

## Scope and verification

Mono PCM16 WAV, 44.1/48 kHz, up to 40 seconds; isolated monophonic distorted guitar,
no other effects. App in English; Spanish and English guides. No test audio included.
No MIDI, note editing or saving analysis. Musical detection is unchanged: all eight
corpus maps match 0.1.0.

36 C# and 5 worker tests passed. Cancellation, worker error, maps, installed files,
same-version candidate replacement, uninstall and reinstall checked. Progress and
playback flow approved by the user on Windows 11. Observed installed-runtime FM-008
runs took 41.8 s and 11.5 s; these are not a speed promise or controlled cold benchmark.

## Known limitations

Detection remains approximate. The app and installer do not have their own digital
signature. Missing-.NET installation, denied elevation, required restart and upgrades
between distinct published installer versions remain beta follow-up FM-021; these
are unverified cases, not passing tests.

## Feedback

https://docs.google.com/forms/d/e/1FAIpQLSff61AyI7QJ6uKt__DELQNoMDd3qc9uB71tVndK2lcOV4g_0w/viewform?usp=header

State 0.2.0 (Other if not listed) and portable or installer in comments.
The form is in Spanish. Audio is not required; contact is optional.
