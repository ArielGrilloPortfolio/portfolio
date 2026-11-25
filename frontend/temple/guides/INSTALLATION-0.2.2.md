# Temple 0.2.2 — Windows x64 installation

Temple-0.2.2-Windows-x64-Setup.exe is a local candidate. Listening qualification remains pending; packaging and native checks do not establish listening acceptance. REAPER is the reference host.

Close audio hosts before installing, updating or uninstalling. Installation is for the current Windows user and requires no administrator privileges. The default plugin is `%LOCALAPPDATA%\Programs\Common\CLAP\Temple.clap`. Documentation, unchanged third-party notices, the payload SHA256 manifest and uninstaller use `%LOCALAPPDATA%\AudioPlugins\Temple`.

Choose the CLAP folder scanned by your host and a separate documentation folder during setup. For the first installation, the documentation/application folder must be new or empty; setup rejects an occupied folder to preserve other applications. A registered Temple installation can be reinstalled in its existing folder. Re-run setup to update or reinstall at the same destinations. Uninstall first before changing either destination. Setup rejects a locked or unwritable plugin; close the host and retry. Replacement is never deferred to reboot.

In REAPER, check Preferences > Plug-ins > CLAP and rescan the installed CLAP folder. Find Temple in the FX browser. If missing, verify the 64-bit host and scan path, then restart the host. Setup does not change REAPER preferences or projects. The editor requires a working OpenGL driver.

Uninstall using Windows Settings > Apps > Installed apps > Temple, or unins000.exe in the documentation folder. Only Temple's installed files and its own registration are removed; unrelated plugins and the shared CLAP folder are preserved.

The setup is unsigned; no signing or SmartScreen reputation is claimed. It downloads no runtime dependencies. MSVC runtime is statically linked, and artwork and font are embedded in the CLAP. No external artwork or font installation is needed. Existing third-party notices are included without changes; no new license grant is supplied.
