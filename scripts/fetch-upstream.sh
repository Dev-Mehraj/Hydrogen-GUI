#!/usr/bin/env bash
set -Eeuo pipefail

# Fetch the upstream GNOME projects used as Hydrogen's initial desktop foundation.
# Run from the root of Hydrogen-GUI: bash scripts/fetch-upstream.sh
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is required." >&2
  exit 1
fi

clone_project() {
  local name="$1"
  local path="$2"
  local url="${3:-https://gitlab.gnome.org/GNOME/${name}.git}"
  local destination="$ROOT/upstream/${path}"

  mkdir -p "$(dirname "$destination")"

  if git config -f .gitmodules --get "submodule.$destination.url" >/dev/null 2>&1; then
    echo "Already registered as a submodule; leaving unchanged: $destination"
    return
  fi

  if [[ -e "$destination" ]]; then
    echo "Error: destination already exists and is not registered as a submodule: $destination" >&2
    echo "Move it aside before rerunning this script." >&2
    return 1
  fi

  echo
  echo "Adding upstream submodule: ${name} -> upstream/${path}"
  git submodule add --depth 1 "$url" "$destination"
}

# Core platform, compositor, shell and session.
clone_project glib platform/glib
clone_project gtk platform/gtk
clone_project libadwaita platform/libadwaita
clone_project gjs platform/gjs
clone_project mutter core/mutter
clone_project gnome-shell core/gnome-shell
clone_project gnome-session core/gnome-session
clone_project gnome-settings-daemon core/gnome-settings-daemon

# Settings, desktop integration and essential services.
clone_project gnome-control-center applications/control-center
clone_project gnome-desktop platform/gnome-desktop
clone_project gsettings-desktop-schemas platform/gsettings-desktop-schemas
clone_project dconf platform/dconf
clone_project gnome-keyring platform/gnome-keyring
clone_project gnome-bluetooth platform/gnome-bluetooth
clone_project gvfs platform/gvfs
clone_project xdg-desktop-portal platform/xdg-desktop-portal https://github.com/flatpak/xdg-desktop-portal.git
clone_project xdg-desktop-portal-gnome platform/xdg-desktop-portal-gnome

# File manager and useful desktop utilities.
clone_project nautilus applications/files
clone_project console applications/console
clone_project gnome-text-editor applications/text-editor
clone_project gnome-system-monitor applications/system-monitor
clone_project gnome-disk-utility applications/disks
clone_project gnome-initial-setup applications/initial-setup

# Artwork and visual assets.
clone_project adwaita-icon-theme resources/icons
clone_project adwaita-fonts resources/fonts
clone_project gnome-backgrounds resources/wallpapers

# GNOME's BuildStream integration metadata is a reference for dependency/build planning.
clone_project gnome-build-meta build/gnome-build-meta

echo
echo "Hydrogen upstream submodules are ready under upstream/."
echo "Review .gitmodules and git status, then commit the submodule references."
echo "Each upstream repository retains its own history, license and copyright notices."
