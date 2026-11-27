# Hydrogen

Hydrogen is an independent Linux desktop environment, initially built on the GNOME technology stack.

> **Project status:** Early development. The repository is establishing its upstream source foundation; Hydrogen-specific redesign and integration will follow.

## Goals

- Provide a complete graphical desktop environment for Linux.
- Remain usable across multiple Linux distributions.
- Use GNOME's mature shell, compositor, libraries and desktop applications as the starting foundation.
- Gradually introduce Hydrogen branding, visual design and native components.
- Develop a separate Hydrogen package manager; it is not part of this repository setup step.

## Upstream source foundation

The initial component list includes GNOME Shell, Mutter, GNOME Session, Settings Daemon, Control Center, Nautilus, GTK, GLib, libadwaita, GJS, desktop integration services, icons, fonts and wallpapers.

See [UPSTREAM_COMPONENTS.md](UPSTREAM_COMPONENTS.md) for the component list and licensing boundaries.

To fetch the upstream source repositories:

```bash
bash scripts/fetch-upstream.sh
```

The script adds shallow Git submodules under `upstream/` and creates `.gitmodules`. After it finishes, review `git status`, then commit and push the submodule references. It does not install software or alter your current desktop session.

## Licensing

Hydrogen-authored material is intended to use the GNU General Public License v3.0 only where applicable. See [LICENSE](LICENSE).

**Upstream components retain their own licenses and copyright notices.** The root license does not override the licenses of separately obtained GNOME projects or their dependencies.
