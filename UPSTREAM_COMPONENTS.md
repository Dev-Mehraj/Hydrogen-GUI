# Hydrogen upstream component manifest

Hydrogen uses GNOME projects as its initial technical foundation. The upstream repositories are added as Git submodules by `scripts/fetch-upstream.sh` under `upstream/`.

## Included projects

| Hydrogen area | Upstream project | Purpose |
|---|---|---|
| Platform | GLib | Core application and system libraries |
| Platform | GTK | GUI toolkit |
| Platform | libadwaita | GNOME-style GTK widgets and patterns |
| Platform | GJS | JavaScript runtime and GNOME bindings |
| Core | Mutter | Window manager and Wayland compositor |
| Core | GNOME Shell | Desktop shell and overview |
| Core | GNOME Session | Session management |
| Core | GNOME Settings Daemon | Hardware and desktop settings services |
| Applications | GNOME Control Center | Graphical settings center |
| Applications | Nautilus | File manager |
| Applications | Console (GNOME Console) | Terminal emulator |
| Applications | GNOME Text Editor | Basic text editor |
| Applications | GNOME System Monitor | System monitoring |
| Applications | GNOME Disk Utility | Disk management UI |
| Applications | GNOME Initial Setup | First-run setup UI |
| Platform | GNOME Desktop | Desktop integration library |
| Platform | GSettings Desktop Schemas | Desktop configuration schemas |
| Platform | dconf | Configuration backend |
| Platform | GNOME Keyring | Credential storage integration |
| Platform | GNOME Bluetooth | Bluetooth integration |
| Platform | GVfs | Virtual and remote filesystems |
| Platform | XDG Desktop Portal (Flatpak project) | Desktop portal interfaces |
| Platform | XDG Desktop Portal GNOME | GNOME portal backend |
| Resources | Adwaita Icon Theme | Base icon assets |
| Resources | Adwaita Fonts | Base font assets |
| Resources | GNOME Backgrounds | Base wallpaper assets |
| Build reference | GNOME Build Metadata | BuildStream component/dependency reference |

## Fetch sources

From the repository root:

```bash
bash scripts/fetch-upstream.sh
```

The script uses shallow Git submodules to avoid downloading full upstream history. It creates `.gitmodules` and stages Git submodule references in the Hydrogen repository. Most projects are hosted in GNOME's GitLab namespace; XDG Desktop Portal is fetched from its upstream Flatpak GitHub repository. Already registered submodules are left untouched. It does not rewrite upstream source, change licenses, install packages, or modify the running desktop.

## Important boundaries

- These projects are separate upstream repositories, not one monolithic GNOME repository.
- Their own license files, copyright notices and attribution must be preserved. Hydrogen's root `LICENSE` applies only to Hydrogen-authored material where the project has the right to license it; it does not replace the licenses of upstream projects.
- This is a source foundation, not yet a complete, buildable desktop distribution. Build dependencies and OS services such as D-Bus, a login manager, NetworkManager, audio services, graphics drivers and system integration must be provided and tested separately.
- The Hydrogen package manager is intentionally not included in this upstream list.
- We will gradually rename, redesign and replace selected GNOME components while keeping upstream changes manageable.
