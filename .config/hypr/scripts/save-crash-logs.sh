#!/usr/bin/env bash
# When start-hyprland restarts a dead Hyprland, the old instance's runtime dir
# (and its log) is still in $XDG_RUNTIME_DIR/hypr until reboot. Copy those logs
# somewhere persistent so the cause of the crash can be found afterwards.

runtime="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/hypr"
dest="$HOME/.cache/hyprland/logs"

for dir in "$runtime"/*/; do
    sig=$(basename "$dir")
    [ "$sig" = "$HYPRLAND_INSTANCE_SIGNATURE" ] && continue
    [ -f "$dir/hyprland.log" ] || continue
    mkdir -p "$dest"
    cp -n "$dir/hyprland.log" "$dest/$sig.log"
done
