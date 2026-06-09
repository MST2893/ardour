# gtk2_ardour code layout

`gtk2_ardour` is Ardour's classic graphical frontend. The code is grouped by DAW-facing areas so the tree is easier to browse than the old single flat directory.

## Main areas

- `app-core`: application startup, `ARDOUR_UI`, global actions, window management, shared frontend glue.
- `editor-view`: the arrangement editor, timeline, regions, selections, rulers, canvas items, track views, and editor-side route UI.
- `mixer`: the mixer page and channel strip code.
- `mixer/pan-knob`: panner widgets and panner editors.
- `mixer/meters-monitoring`: meters, monitoring, DSP stats, and related level/loudness UI.
- `mixer/routing`: I/O selectors, port matrices, sends, returns, route properties, and routing dialogs.
- `plugins`: plugin selectors, generic/plugin-native UIs, processor boxes, LV2/VST/AU/VST3 integration.
- `midi-pianoroll`: MIDI editing, notes, piano roll, patch changes, step entry, velocity, and virtual keyboard pieces.
- `clips-cues-trigger`: cue editors, trigger page, trigger strips, clip picking, and trigger source/route lists.
- `automation`: automation controllers, lines, stream views, and time-axis helpers.
- `transport-clocks`: clocks, transport controls, shuttle/varispeed, and time display helpers.
- `import-export-video`: import/export flows, analysis graphs, SFDB, video timeline, transcoding, and video dialogs.
- `session-config-dialogs`: session lifecycle, preferences, option editors, setup dialogs, templates, save flows, and recorder UI.
- `lua-scripting`: Lua dialogs, windows, script manager, and Lua instance glue.
- `platform-support`: platform-specific bundle/environment code and low-level support files.
- `shared-ui`: small reusable UI/support components that do not belong cleanly to one DAW surface.

Resource folders such as `icons`, `resources`, `themes`, `po`, `appdata`, `msvc`, and `win32` keep their existing layout because build, packaging, and translation tooling refer to them directly.
