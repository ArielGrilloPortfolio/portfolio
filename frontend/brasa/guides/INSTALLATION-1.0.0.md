# Brasa 1.0.0 — Windows x64 installation

Close your audio host before installing, updating or uninstalling Brasa. Run Brasa-1.0.0-Windows-x64-Setup.exe. Installation is for the current Windows user and does not require administrator rights.

The default CLAP location is `%LOCALAPPDATA%\Programs\Common\CLAP\Brasa.clap`, the standard user CLAP search path. Documentation, third-party notices and the uninstaller are stored separately in `%LOCALAPPDATA%\AudioPlugins\Brasa`. The installer lets you choose folders and remembers the CLAP folder for reinstalls. Uninstall first if you need to move an existing installation to another CLAP folder.

In REAPER, open Preferences > Plug-ins > CLAP, check that the installed CLAP folder is scanned, then rescan. Find Brasa in the FX browser. No REAPER preferences are changed by the installer. If Brasa is missing, verify that the host is 64-bit, check the CLAP scan path and restart the host after rescanning. A working OpenGL 2 graphics driver is required by the existing editor.

Re-run setup to reinstall/update the same installation. Setup refuses a locked or non-writable Brasa.clap; close hosts before retrying. There is no deferred replacement at reboot. Remove Brasa through Windows Settings > Apps > Installed apps > Brasa, or run unins000.exe in its documentation folder. Uninstall removes Brasa's installed files and registration; it preserves other CLAP plugins and does not remove the shared CLAP folder or user projects/preferences.

The setup executable is unsigned. No signing or SmartScreen reputation is claimed. It contains the CLAP and documentation; it does not download runtime dependencies. MSVC runtime is statically linked. There is no new Brasa EULA or license grant; existing third-party notices are supplied under third-party.

Version 1.0.0 identifies this packaged build. DSP remains experimental: human listening acceptance, full real-host gesture/audio cancellation and driver acceptance remain pending. See README.md and the repository DSP reports for existing measurement limitations.
